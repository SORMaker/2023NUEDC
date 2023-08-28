#include "easy_ui_user_app.h"

EasyUIPage_t pageMain, pageSetCoord, pageSetAngle, pageCalibrate;

EasyUIItem_t titleMain, titleSetCoord, titleSetAngle, itemCoord, itemAngle, itemCalibrate;

EasyUIItem_t itemRun, itemBase, itemSquare, itemCoordX, itemCoordY, itemAngleYaw, itemAnglePitch;

void EventChaseLoop(EasyUIItem_t *item) {
    cursorResume(&global_cursor);
    pidClear(&chaseXPid);
    pidClear(&chaseYPid);
    while (true) {
        if(isCatchPoint()==false){
            cursorSetPointSport(&global_cursor, -50, 0, 800);
            while (global_cursor.is_sporting) {
                if (isCatchPoint()) {
                    global_cursor.is_sporting=false;
                    chase_enable = true;
                    beepTime = 1000;
                    break;
                }
            }
            if (opnExit) {
                cursorSetPointSport(&global_cursor, 0, 0, 1000);
                while (global_cursor.is_sporting);
                chase_enable = false;
                cursorReset(&global_cursor);
                opnExit = false;
                functionIsRunning = false;
                EasyUIBackgroundBlur();
                break;
            }
            cursorSetPointSport(&global_cursor, 50, 0, 800);
            while (global_cursor.is_sporting) {
                if (isCatchPoint()) {
                    global_cursor.is_sporting=false;
                    chase_enable = true;
                    beepTime = 1000;
                    break;
                }
            }
            if (opnExit) {
                cursorSetPointSport(&global_cursor, 0, 0, 1000);
                while (global_cursor.is_sporting);
                chase_enable = false;
                cursorReset(&global_cursor);
                opnExit = false;
                functionIsRunning = false;
                EasyUIBackgroundBlur();
                break;
            }
        }
        else{
            chase_enable = true;
            beepTime = 1000;
        }
        while(chase_enable){
            if (opnExit) {
                cursorSetPointSport(&global_cursor, 0, 0, 1000);
                while (global_cursor.is_sporting);
                chase_enable = false;
                cursorReset(&global_cursor);
                opnExit = false;
                functionIsRunning = false;
                EasyUIBackgroundBlur();
                break;
            }
        }
        if (functionIsRunning == false)break;
    }

}

void EventBaseLoop(EasyUIItem_t *item) {
    cursorResume(&global_cursor);
    cursorSetPointSport(&global_cursor, 25, 25, 2000);
    while (global_cursor.is_sporting);
    beepTime = 100;
    cursorSetPointSport(&global_cursor, 25, -25, 2000);
    while (global_cursor.is_sporting);
    beepTime = 100;
    cursorSetPointSport(&global_cursor, -25, -25, 2000);
    while (global_cursor.is_sporting);
    beepTime = 100;
    cursorSetPointSport(&global_cursor, -25, 25, 2000);
    while (global_cursor.is_sporting);
    beepTime = 100;
    cursorSetPointSport(&global_cursor, 25, 25, 2000);
    while (global_cursor.is_sporting);
    beepTime = 500;
    cursorSetPointSport(&global_cursor, 0, 0, 500);
    while (global_cursor.is_sporting);
    opnExit = false;
    functionIsRunning = false;
    EasyUIBackgroundBlur();
}




int16 global_x_bias=0,global_y_bias=0;
bool enable_square_chase = false;
typedef struct {
    int16 X;
    int16 Y;
}node_Typedef;
#define     PATH_BUFFER_MAX_SIZE 200
#if PATH_BUFFER_MAX_SIZE%4!=0
#error "must mod by 4!!"
#endif
node_Typedef PathBuff[PATH_BUFFER_MAX_SIZE] = {0};
node_Typedef CornerNodeBuff[4] = {0};
void getCornerNodes(void){
    memset(CornerNodeBuff,0,sizeof(node_Typedef)*4);

}
void generatePath(void){
    memset(PathBuff,0, sizeof(node_Typedef));
    int16 X_bias,Y_bias;
    for(int i=0;i<4;i++){
        if(i!=3){
            X_bias = CornerNodeBuff[i+1].X - CornerNodeBuff[i].X;
            Y_bias = CornerNodeBuff[i+1].Y - CornerNodeBuff[i].Y;
        }
        else{
            X_bias = CornerNodeBuff[0].X - CornerNodeBuff[3].X;
            Y_bias = CornerNodeBuff[0].Y - CornerNodeBuff[3].Y;
        }
        for(int j=0;j<PATH_BUFFER_MAX_SIZE/4;j++){
            PathBuff[i*PATH_BUFFER_MAX_SIZE+j].X = CornerNodeBuff[i].X + X_bias*j/(PATH_BUFFER_MAX_SIZE/4);
            PathBuff[i*PATH_BUFFER_MAX_SIZE+j].Y = CornerNodeBuff[i].Y + Y_bias*j/(PATH_BUFFER_MAX_SIZE/4);
        }
    }
    beepTime = 200;
}
node_Typedef getRedPoint(){
    node_Typedef temp;


    return temp;
}
#define FORECAST_FACTOR 10
void EventSquareLoop(EasyUIItem_t *item) {
    getCornerNodes();
    generatePath();
    int16 index=0;
    int16 N = FORECAST_FACTOR;
    double x,y,min_distance,temp;int16_t min_index;
    enable_square_chase = true;
    while(true){
        node_Typedef red_point = getRedPoint();
        if(index+N +1 > PATH_BUFFER_MAX_SIZE-1)
        {
            N = PATH_BUFFER_MAX_SIZE-1 - index -1;
        }
        for(uint16_t i=index; i<=(uint16_t)(index+N+1); i++){
            temp = sqrt(pow(PathBuff[i].X - red_point.X,2)+pow(PathBuff[i].Y - red_point.Y,2));
            if(i==index)
            {
                min_distance = temp;
                min_index = index;
            }
            else if (temp < min_distance)
            {
                min_distance = temp;
                min_index = i;
            }
        }
        index = min_index;
        global_x_bias = red_point.X - PathBuff[min_index].X;
        global_y_bias = red_point.Y - PathBuff[min_index].Y;
        if(index!=PATH_BUFFER_MAX_SIZE-1)
        {
        }
        else{
            beepTime = 2000;
            enable_square_chase = false;
            opnExit = false;
            functionIsRunning = false;
            EasyUIBackgroundBlur();
            break;
        }
        if (opnExit) {
            enable_square_chase = false;
            opnExit = false;
            functionIsRunning = false;
            EasyUIBackgroundBlur();
            break;
        }
    }
}






void PageCalibrate(EasyUIItem_t *item) {
    static bool flag = false;
    static uint8 point_flag = false;
    static float biasX;
    static float biasY;
    static float biasXLeft;
    static float biasXRight;
    static float biasYTop;
    static float biasYBottom;
    IPS114_ClearBuffer();
    if (point_flag == 0)
        IPS114_ShowStr(0, 2, "[Center Point]");
    else if (point_flag == 1)
        IPS114_ShowStr(0, 2, "[Left-Top Point]");
    else if (point_flag == 2)
        IPS114_ShowStr(0, 2, "[Right-Bottom Point]");

    IPS114_ShowStr(0, 14, "currentX:");
    IPS114_ShowStr(0, 26, "currentY:");
    IPS114_ShowFloat(60, 14, global_cursor.X, 3, 2);
    IPS114_ShowFloat(60, 26, global_cursor.Y, 3, 2);
    IPS114_SendBuffer();
    if (opnMultiClick) {
        opnMultiClick = 0;
        if (point_flag == 0) {
            biasX = global_cursor.X;
            biasY = global_cursor.Y;
        } else if (point_flag == 1) {
            biasXLeft = global_cursor.X - (-25.0) + biasX;
            biasYTop = global_cursor.Y - 25.0 + biasY;
        } else if (point_flag == 2) {
            biasXRight = global_cursor.X - 25.0 + biasX;
            biasYBottom = global_cursor.Y - (-25.0) + biasY;
        }
        if (++point_flag == 3) {
            point_flag = 0;
        }
        beepTime = 500;
        EasyUIDrawMsgBox("Saving...");

    }
    if (opnEnter) {
        beepTime = 100;
        flag = flag ? false : true;
        opnEnter = 0;
    }
    if (opnDown) {
        beepTime = 100;
        opnDown = 0;
        if (flag)
            cursorSetPoint(&global_cursor, global_cursor.X + 5, global_cursor.Y);
        else
            cursorSetPoint(&global_cursor, global_cursor.X, global_cursor.Y + 5);
    }
    if (gpio_get_level(KEY_DOWN) == 0 && keyDown.holdTime >= HOLD_THRESHOLD_MS) {
        if (flag)
            cursorSetPoint(&global_cursor, global_cursor.X + 0.25, global_cursor.Y);
        else
            cursorSetPoint(&global_cursor, global_cursor.X, global_cursor.Y + 0.25);
    }
    if (opnUp) {
        beepTime = 100;
        opnUp = 0;
        if (flag)
            cursorSetPoint(&global_cursor, global_cursor.X - 5, global_cursor.Y);
        else
            cursorSetPoint(&global_cursor, global_cursor.X, global_cursor.Y - 5);
    }
    if (gpio_get_level(KEY_UP) == 0 && keyUp.holdTime >= HOLD_THRESHOLD_MS) {
        if (flag)
            cursorSetPoint(&global_cursor, global_cursor.X - 0.25, global_cursor.Y);
        else
            cursorSetPoint(&global_cursor, global_cursor.X, global_cursor.Y - 0.25);
    }
    if (opnExit) {
        if (point_flag == 0) {
            biasX = global_cursor.X + global_cursor.biasX;
            biasY = global_cursor.Y + global_cursor.biasY;
        } else if (point_flag == 1) {
            biasXLeft = global_cursor.X - (-25.0) + biasX;
            biasYTop = global_cursor.Y - 25.0 + biasY;
        } else if (point_flag == 2) {
            biasXRight = global_cursor.X - 25.0 + biasX;
            biasYBottom = global_cursor.Y - (-25.0) + biasY;
        }
        if (point_flag == 2) {
            point_flag = 0;
        }
        beepTime = 800;
        EasyUIDrawMsgBox("Saving...");
        cursorInit(&global_cursor, biasX, biasY, biasXLeft, biasXRight, biasYTop, biasYBottom);
        flag = false;
        point_flag = false;
        biasX = biasY = biasXLeft = biasXRight = biasYTop = biasYBottom = 0;
        EasyUIBackgroundBlur();
    }
}

void MenuInit() {
    EasyUIAddPage(&pageMain, PAGE_LIST);
    EasyUIAddPage(&pageSetCoord, PAGE_LIST);
    EasyUIAddPage(&pageSetAngle, PAGE_LIST);
    EasyUIAddPage(&pageCalibrate, PAGE_CUSTOM, PageCalibrate);

    EasyUIAddItem(&pageMain, &titleMain, "[Main]", ITEM_PAGE_DESCRIPTION);
    EasyUIAddItem(&pageMain, &itemRun, "Run Chase", ITEM_MESSAGE, "Running...", EventChaseLoop);
//    EasyUIAddItem(&pageMain, &itemBase, "Run Base", ITEM_MESSAGE, "Running...", EventBaseLoop);
    EasyUIAddItem(&pageMain, &itemSquare, "Run Square", ITEM_MESSAGE, "Running...", EventSquareLoop);

    EasyUIAddItem(&pageMain, &itemCoord, "Set Coord", ITEM_JUMP_PAGE, pageSetCoord.id);
    EasyUIAddItem(&pageMain, &itemAngle, "Set Angle", ITEM_JUMP_PAGE, pageSetAngle.id);
    EasyUIAddItem(&pageMain, &itemCalibrate, "Calibrate", ITEM_JUMP_PAGE, pageCalibrate.id);


    EasyUIAddItem(&pageSetCoord, &titleSetCoord, "[Coord Setting]", ITEM_PAGE_DESCRIPTION);
    EasyUIAddItem(&pageSetAngle, &titleSetAngle, "[Angle Setting]", ITEM_PAGE_DESCRIPTION);

    EasyUIAddItem(&pageSetCoord, &itemCoordX, "Set Coord X", ITEM_CHANGE_VALUE, &global_X, EasyUIEventChangeFloat);
    EasyUIAddItem(&pageSetCoord, &itemCoordY, "Set Coord Y", ITEM_CHANGE_VALUE, &global_Y, EasyUIEventChangeFloat);
    EasyUIAddItem(&pageSetAngle, &itemAngleYaw, "Set Angle Yaw", ITEM_CHANGE_VALUE, &global_yaw,
                  EasyUIEventChangeFloat);
    EasyUIAddItem(&pageSetAngle, &itemAnglePitch, "Set Angle Pitch", ITEM_CHANGE_VALUE, &global_pitch,
                  EasyUIEventChangeFloat);
}
