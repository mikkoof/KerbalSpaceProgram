CLEARSCREEN.

LOCK THROTTLE TO 1.0.  
set stage2 to false.
set Roll to -15.
LOCK STEERING TO HEADING (Roll, 90).
//set fairings to false.
PRINT "Counting down:".
FROM {local countdown is 10.} UNTIL countdown = 0 STEP {SET countdown to countdown - 1.} DO {
    PRINT "..." + countdown.
    WAIT 1. // pauses the script here for 1 second.
}

STAGE.  print "Main engine(s) online.".
WAIT 5.
STAGE.  print "Liftoff!".
WHEN STAGE:HTP < 2.3 THEN {
    STAGE.
    WAIT 0.8.
    STAGE.
    set stage2 to true.
}

wait until ship:verticalspeed > 90.
set tr to ship:altitude.
FROM {local Pitch is 89.75.} UNTIL Pitch = 45 STEP {set Pitch to Pitch - 0.25.} DO {
        set tr to tr + 150.
        wait until ship:altitude > tr. 
        
        LOCK STEERING TO HEADING (Roll, Pitch).
        clearScreen.
        print "Altitude:" + tr.
        print "Pitch" + Pitch.
        print "Roll:" + Roll.
}
wait until ship:apoapsis > 110000.
from {local Pitch is 45.} UNTIL Pitch = -1 STEP {set Pitch to Pitch - 0.5.} DO {
    set ap to ship:apoapsis + 2000.
    if orbit:inclination > 95 {
         set Roll to -9.
    }
    wait until ship:apoapsis > ap.
    
    LOCK STEERING TO HEADING (Roll, Pitch).
    clearScreen.
    print "Apoapsis" + ship:apoapsis.
    print "Pitch:" + Pitch.
    print "roll:" + Roll.
}

if stage2 = true {
    when stage:UDMH < 0.1 then {
        set rcs to true.
    }
    wait until ETA:apoapsis < 30.
    stage.
    wait 0.7.
    stage.
    wait until ship:periapsis > 300000.
    wait until orbit:eccentricity > 0.02.
    //wait until stage:Aniline < 0.1.
    Lock THROTTLE TO 0.  
}
wait until false..