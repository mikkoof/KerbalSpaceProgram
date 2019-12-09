CLEARSCREEN.
LOCK STEERING TO HEADING (88, 90).
LOCK THROTTLE TO 1.0.  
set stage2 to false.
set stage1 to false.
//set fairings to false.
PRINT "Counting down:".
FROM {local countdown is 10.} UNTIL countdown = 0 STEP {SET countdown to countdown - 1.} DO {
    PRINT "..." + countdown.
    WAIT 1. // pauses the script here for 1 second.
}

STAGE.  print "Main engine(s) online.".
WAIT 5.
STAGE.  print "Liftoff!".
WHEN STAGE:HTP < 0.6 THEN {
    STAGE.
    WAIT 0.8.
    STAGE.
    set stage2 to true.
    //set fairings to true.
}

//when ship:altitude > 80000 then {
//    if fairings = true{
//    stage.
//    set fairings to false.
//    }
//}

wait until ship:verticalspeed > 100.
set tr to ship:altitude.
FROM {local Pitch is 89.75.} UNTIL Pitch = 45 STEP {set Pitch to Pitch - 0.25.} DO {
        set tr to tr + 190.
        wait until ship:altitude > tr. 
        
        LOCK STEERING TO HEADING (88, Pitch).
        clearScreen.
        print "Altitude:" + tr.
        print "Pitch" + Pitch.
}
wait until stage2 = true.
set x to ((stage:UDMH / 90) / 4.2329).
from {local Pitch is 45.} UNTIL Pitch = -2 STEP {set Pitch to Pitch - 1.} DO {
    wait x.
    LOCK STEERING TO HEADING (88, Pitch).
    clearScreen.
    print "Apoapsis" + ship:apoapsis.
    print "Pitch:" + Pitch.
}

if stage2 = true {
    when stage:UDMH < 0.1 then {
        wait until ETA:apoapsis < 35.1.
        set rcs to true.
        SET SHIP:CONTROL:FORE to 1.
        wait 6.
        stage.
        wait 0.8.
        stage.
        wait until stage:Aniline = 0.
        stage.
        set stage1 to true.
    }
}
wait until stage1 = true.
SET SHIP:CONTROL:FORE to 0.