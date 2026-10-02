# Tracking animation model

The animation illustrates the repository's green-firmware controller with an assumed plant. It is **not hardware footage, measured tracking accuracy, or an end-to-end firmware emulator**. Its coordinates and reported errors are arbitrary calibrated model units, not calibrated pixels or millimetres.

## Repository parameters

| Parameter | Value and source |
| --- | --- |
| Controller | Incremental PI: `Kp = -0.1`, `Ki = -0.0035`, `Kd = 0`; [pid.c](../Ccode/green_firm/project/code/pid.c) |
| Controller interval | 2 ms, or 500 Hz; [ctrl.c](../Ccode/green_firm/project/code/ctrl.c) |
| Coordinate transmission | 1000 ms; [PyCode/main.py](../PyCode/main.py). Camera frames are processed separately; this is not a measured camera frame rate. |
| PWM period | 20 ms, or 50 Hz; [moto.h](../Ccode/green_firm/project/code/moto.h) |
| Hold hysteresis | Freeze when the squared measured residual is below 18; resume above 60; [ctrl.c](../Ccode/green_firm/project/code/ctrl.c) |
| Numerical limits | Integral increment: ±1000. Accumulated X/Y outputs: ±906.667 / ±936.667, from `GetYawServoDuty(30)` / `GetPitchServoDuty(30)`. These are not ±30° command limits. |

Let the signed measured displacement be `b = target - tracker`. Firmware calculates `e = -b`. With derivative gain zero, each active controller tick applies:

```text
u[k] = clip(u[k-1] - 0.1*(e[k] - e[k-1])
                    + clip(-0.0035*e[k], 1000), output_limit)
```

Here `clip(x, L)` means clamping to `[-L, L]`. Equivalently, positive `b` increases the command. The integral increment contains no explicit time factor: its continuous-time approximation is `0.0035 / 0.002 = 1.75` per second.

The model preserves the firmware's update-before-hysteresis order. While held, controller output and error history freeze; the plant can still move toward its last command. The hold/resume radii are approximately 4.24 and 7.75 received-coordinate units. Tracking is assumed enabled, unhalted, and continuously detected. Firmware's target-loss and search states are not simulated.

## Assumed plant and feedback

The animation's offline simulation holds each measurement for one second and samples controller commands at 20 ms PWM boundaries. The plant is an illustrative first-order position response:

```text
dy/dt = (0.6*u_pwm - y) / 0.16
```

Gain `0.6`, time constant `0.16 s`, unity camera-coordinate gain, and timer phase alignment are assumptions. The 2 ms plant step uses the exact exponential update for its held command. No additional serial/parsing delay, noise, quantization, backlash, packet loss, or mechanical limits are modeled. JavaScript double precision is used rather than MCU float32 arithmetic.

Actual [cursor.c](../Ccode/green_firm/project/code/cursor.c) applies calibration and `atan(coordinate / 100)` before angle-to-PWM conversion. The model replaces that geometry and the unknown servo dynamics with the local plant above. Its physical scale and real hardware dynamics have not been identified.

The feedback-coordinate assumption is essential: checked-in Python transmits **absolute blob coordinates**, while [green main.c](../Ccode/green_firm/project/user/src/main.c) only computes `cx - 18` and `cy + 18`. It does not subtract the image centre or establish `target - tracker`. The animation assumes a compatible signed calibration transform; it does not implement or validate one in firmware.

## Moving target and error

The target is a smooth, deterministic multisine with seeded amplitudes/phases (`2023`), harmonics 1, 2, 3, and 5, and a 16-second repeat period. Axis amplitudes are 90 and 37.5 model units. It appears irregular but is periodic, not an unbounded random walk. No future target values feed the controller.

For a stable, unsaturated linear position loop with finite plant DC gain `G`, ignoring hold hysteresis, PI can eliminate constant-target steady-state error. For sufficiently slow constant-velocity motion `v`, the approximation is `e_ss ≈ v / (1.75*G)`. This conditional result is not an exact error prediction for this sampled, nonlinear animation. Changes in direction, measurement age, plant lag, and holding produce varying lag and possible overshoot. A 500 Hz calculation rate does not replace fresh measurements: about 500 updates reuse each one-second sample.

The complete model state is warmed through whole target periods until it repeats. There is **no endpoint blend, crossfade, or correction of tracker positions**. Frames sample this trajectory at 20 fps. The generated trajectory was checked for periodic state closure and a stationary-target hold response. These checks establish internal simulation consistency, not real-world tracking performance.
