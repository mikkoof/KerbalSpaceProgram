CLEARSCREEN.
LOCK STEERING TO R(0,0,270) + HEADING (85, 90).
LOCK THROTTLE TO 1.0.  
PRINT "Counting down:".
FROM {local countdown is 5.} UNTIL countdown = 0 STEP {SET countdown to countdown - 1.} DO {
    PRINT "..." + countdown.
    WAIT 1. // pauses the script here for 1 second.
}

STAGE.  print "Main engine(s) online.".
WAIT 5.
STAGE.  print "Liftoff!".
set stage3 to false.
WHEN STAGE:HTP < 1.6 THEN {
STAGE.
WAIT 0.8.
STAGE.
set stage3 to true.
}
WHEN stage3 = true then {
    WHEN stage:Kerosene < 9.1 THEN {
        
            STAGE.
            WAIT 0.8.
            STAGE.
            unlock steering.
        }
}
wait until ship:verticalspeed > 45.
set tr to ship:altitude.
FROM {local Pitch is 89.75.} UNTIL Pitch = 45 STEP {set Pitch to Pitch - 0.25.} DO {
    clearScreen.

    set tr to tr + 80.
    wait until ship:altitude > tr. 
    
    LOCK STEERING TO R(0,0, 270) + HEADING (85, Pitch).

    print "Altitude:" + tr.
    print "Pitch" + Pitch.
}

wait until ship:apoapsis > 140000.

set ap to 140000.
from {local Pitch is 40.} UNTIL Pitch = 25 STEP {set Pitch to Pitch - 1.} DO {
    clearScreen.

    set ap to ap + 1000.
    wait until ship:apoapsis > ap. 
    LOCK STEERING TO R(0,0,0) + HEADING (85, Pitch).

    print "Goal Apoapsis" +ap.
    print "Apoapsis" + ship:apoapsis.
    print "Pitch:" + Pitch.
}

wait until false.