# System architecture and source review

This repository contains a MaixPy vision application and two CH32V307 firmware projects: a green tracking controller and a red trajectory controller. The architecture figure summarizes their source-level responsibilities. It does not establish that the checked-in versions form a calibrated, hardware-validated system. In particular, the red firmware expects a vision message that the included Python application does not produce.

In the figure, the neutral connector groups each controller's own UI responsibilities; it is not an electrical bus or a shared display. The tracking inset is an explanatory model, separate from the physical module connections.

## Repository map

| Component | Responsibility and entry point |
| --- | --- |
| Vision | K210/MaixPy camera setup, color-blob detection, centroid packets: [PyCode/main.py](../PyCode/main.py#L151). |
| Green controller | UART feedback, incremental PI, coordinate-to-angle mapping, servo output: [main.c](../Ccode/green_firm/project/user/src/main.c#L58), [ctrl.c](../Ccode/green_firm/project/code/ctrl.c#L19). |
| Red controller | Corner teaching, trajectory generation and playback: [main.c](../Ccode/red_firm/project/user/src/main.c#L84), [ctrl.c](../Ccode/red_firm/project/code/ctrl.c#L63). |
| Operator interfaces | EasyUI, EasyKey, display and buzzer in each firmware's `project/code` directory. |
| Hardware support | WCH SDK and Seekfree `zf_common`, `zf_driver`, `zf_device` libraries under each firmware's `libraries` directory. |
| Wire protocol | Python-local implementations, a green-local implementation, and a [standalone C copy](../Upacker/upacker.c). Red's build does not automatically use that standalone copy. |
| Supporting scripts | [CameraDemo.py](../PyCode/CameraDemo.py), [UartDemo.py](../PyCode/UartDemo.py), [takeAphoto_DS.py](../PyCode/takeAphoto_DS.py). These are separate board programs. |
| Presentation | README images and [tracking-model notes](TRACKING_MODEL.md). The pseudorandom animation and actuator model are documentation assets, not firmware functions. |

## Green tracking path

1. **Observe.** The camera captures RGB565 QVGA frames, with horizontal and vertical flips. Although five regions are declared, the loop examines only the central **100 × 100** region. It selects the blob with the largest pixel count and stores its absolute image centroid. [Detection loop](../PyCode/main.py#L224), [selection](../PyCode/main.py#L139).
2. **Transmit.** The latest centroid becomes two little-endian signed 16-bit integers, `<hh>`. A timer sends the latest prepared packet every **1,000 ms**; this is the transmission period, not the camera frame rate. [Packing](../PyCode/main.py#L109), [timer](../PyCode/main.py#L178).
3. **Decode.** UART7 receives a frame, then the 10 ms service interrupt calls the unpacker. The receive callback subtracts fixed offsets `(18, −18)`. [UART ISR](../Ccode/green_firm/project/user/src/isr.c#L131), [callback](../Ccode/green_firm/project/user/src/main.c#L38).
4. **Control.** The `Run Chase` menu enables acquisition and following. A search sweep is available when no point is reported. Every 2 ms, separate X/Y incremental controllers calculate new commands. Their defaults are `Kp = −0.1`, `Ki = −0.0035`, `Kd = 0`, so the active default is **PI**. A proximity latch holds output below squared error 18 and resumes above 60. [Mode](../Ccode/green_firm/project/code/easy_ui_user_app.c#L9), [controller](../Ccode/green_firm/project/code/ctrl.c#L19), [gains](../Ccode/green_firm/project/code/pid.c#L144).
5. **Actuate.** The cursor applies calibration offsets, converts coordinates with `atan`, and maps yaw/pitch to two 50 Hz PWM outputs. [Geometry](../Ccode/green_firm/project/code/cursor.c#L27), [PWM](../Ccode/green_firm/project/code/moto.c#L6).

Optical observation can close this loop only with the appropriate camera placement and coordinate calibration. The checked-in vision program detects one blob; it does not calculate the difference between independently detected red and green spots. Moving-target error depends on that geometry, the slow feedback updates, the PI gains, output limits and real servo dynamics. The animation's explicit assumptions are documented separately.

## Red trajectory path

The red project represents a separate workflow. Its receive callback expects **21 payload bytes**: one center coordinate pair, four corner pairs, and a validity byte. It interprets a **160 × 120** image. When valid corner data arrives, the main loop calculates rectangle geometry and fills a point buffer. [Receiver](../Ccode/red_firm/project/user/src/main.c#L39), [frame dimensions](../Ccode/red_firm/project/code/ctrl.h#L50), [path preparation](../Ccode/red_firm/project/user/src/main.c#L123).

The operator can instead teach three corners. `LaserGoSquare()` creates five vertices, including the return to the first vertex. Selecting a run mode enables TIM2; playback converts buffered coordinates to servo angles and writes PWM registers. The timer period is 4 ms, with additional dwell for the five-vertex route. This path uses geometric playback; the bundled PID source is not called by the active playback handler. [Teaching](../Ccode/red_firm/project/code/easy_ui_user_app.c#L70), [vertices](../Ccode/red_firm/project/code/ctrl.c#L85), [playback](../Ccode/red_firm/project/user/src/isr.c#L355).

No included Python program produces the required corner message. The two MCU projects should not be depicted as communicating directly with one another.

## Interfaces and timing

| Interface | Configuration in source |
| --- | --- |
| Vision UART | UART1, TX pin 7 / RX pin 6, 115200 baud: [configuration](../PyCode/main.py#L173). |
| MCU vision input | UART7, PE12 TX / PE13 RX, 115200 baud in [green](../Ccode/green_firm/project/user/src/main.c#L62) and [red](../Ccode/red_firm/project/user/src/main.c#L92). |
| Framing | `0x55`, a 14-bit payload length, and packed XOR-derived header/payload checks in a four-byte header: [Python encoder](../PyCode/main.py#L84), [C implementation](../Ccode/green_firm/project/code/upacker.c#L148). |
| Green scheduling | TIM1: control/cursor every 2 ms. TIM3: keys, decoding, buzzer every 10 ms: [setup](../Ccode/green_firm/project/code/ctrl.c#L10). |
| Green actuation | TIM2 PWM, PA0 yaw / PA1 pitch, 50 Hz: [definitions](../Ccode/green_firm/project/code/moto.h#L6). |
| Red scheduling/output | TIM1: keys/buzzer every 10 ms. TIM2: playback every 4 ms. TIM4 PWM: PD12 upper / PD14 bottom servo, 50 Hz: [setup](../Ccode/red_firm/project/user/src/main.c#L100). |

The active application link is vision-to-MCU. Receive helpers in Python and transmit callbacks in C exist, but the main vision loop does not process incoming commands, and both MCU echo calls are commented out. Their presence is not evidence of an active return channel.

Upacker's checks are partial XOR checks, not a polynomial CRC. There is no message-type field, sequence number, or acknowledgement in this format. Declared payload capacities differ: Python 1156 bytes, standalone C 1024, and green C 100. The green UART also stages the whole wire frame in a 100-byte buffer, so its declared payload limit is not an end-to-end safe capacity. The current application only needs a four-byte centroid payload; malformed or oversized frames remain a separate correctness issue.

## On-board interaction and supporting code

Green uses an IPS114 **240 × 135** SPI2 display, three physical keys on PE2/PE3/PE4, a PA8 pause/resume input, and a PB10 buzzer. Calibration directly updates cursor state in RAM. The manual coordinate/angle pages exist, but their application to the cursor is commented out. [Panel definitions](../Ccode/green_firm/project/code/easy_ui.h#L29), [pause](../Ccode/green_firm/project/code/cursor.c#L60), [calibration](../Ccode/green_firm/project/code/easy_ui_user_app.c#L199).

Red uses an IPS096 **160 × 80** display and five distinct key inputs. Its menu exposes teaching, playback and settings. The registered flash-save menu persists UI flags such as color reversal and list looping; teaching coordinates are not registered for persistence. [Panel](../Ccode/red_firm/project/code/easy_ui.h#L28), [menu](../Ccode/red_firm/project/code/easy_ui_user_app.c#L211).

The standalone camera demo visualizes blobs in multiple regions. The UART demo sends a three-byte `<bh>` payload while its callback expects seven bytes, so it is a protocol example rather than a matching controller peer. The photo helper captures JPEGs to `/sd/DS/`. [Demo payloads](../PyCode/UartDemo.py#L106), [photo capture](../PyCode/takeAphoto_DS.py#L14).

Both firmware trees bundle drivers for many additional devices, including GPS, IMUs, DVP cameras and wireless modules. Entry-point initialization and application calls establish the active UART, timers, PWM, GPIO, SPI display and flash paths. Included drivers or template ISR callbacks alone do not establish installed peripherals. NMEA, VOFA and other helper files likewise should not become active blocks in the system figure without a reachable call path.

## Integration findings, in priority order

1. **Missing red dependencies and incompatible contracts.** Red's [CMake list](../Ccode/red_firm/CMakeLists.txt#L190) references absent `project/user/inc/isr.h` and `project/code/upacker.c/.h`. The included 4-byte/QVGA vision producer cannot satisfy its 21-byte/160 × 120 receiver. Green also needs an explicit conversion from absolute image coordinates to its expected feedback origin.
2. **UI memory accesses need correction before runtime claims.** [Green menu initialization](../Ccode/green_firm/project/code/easy_ui.c#L38) dereferences initially null `flag` and `param` pointers before binding them. Its UI [parameter type is double](../Ccode/green_firm/project/code/easy_ui.h#L83), but [menu bindings](../Ccode/green_firm/project/code/easy_ui_user_app.c#L316) pass float globals.
3. **Loss and malformed frames lack adequate handling.** Vision retains the last centroid when no blob appears; green has no feedback-age timeout. Both receive callbacks ignore payload length. Green's [UART buffer](../Ccode/green_firm/project/user/src/isr.c#L142) lacks a capacity check, and its [decoder](../Ccode/green_firm/project/code/upacker.c#L99) overwrites the oversized-frame rejection state. Red's center-X expression also has a [precedence error](../Ccode/red_firm/project/user/src/main.c#L41).
4. **Some motion modes are incomplete or can stall.** Green's [square mode](../Ccode/green_firm/project/code/easy_ui_user_app.c#L114) has empty/uninitialized point providers and out-of-bounds path indexing. Red's [path loops](../Ccode/red_firm/project/code/ctrl.c#L178) can `continue` without advancing. Green's PA8 handler busy-waits inside its control interrupt, and cursor interpolation assumes 1 ms ticks although the ISR runs every 2 ms.
5. **Photo helper counter scope.** `takeAPhoto()` increments `count` without declaring it global, causing an error on capture: [source](../PyCode/takeAphoto_DS.py#L14).

These findings document the inspected snapshot; this documentation change does not modify the firmware or Python applications.
