CLEARSCREEN.
set manual to false.
LOCK THROTTLE TO 1.0.  
set stage2 to false.
set Roll to 62.
LOCK STEERING TO HEADING (Roll, 90).
//set fairings to false.
PRINT "Counting down:".
FROM {local countdown is 5.} UNTIL countdown = 0 STEP {SET countdown to countdown - 1.} DO {
    PRINT "..." + countdown.
    WAIT 1. // pauses the script here for 1 second.
}
STAGE.  print "Main engine(s) online.".
WAIT 5.
STAGE.  print "Liftoff!".
Set Fuel1 to stage:Kerosene.
print Fuel1.
wait 1.
set FuelUse to stage:Kerosene.
print FuelUse.
set sat to Fuel1 - FuelUse.
print sat.
WHEN STAGE:Kerosene < 0.1 THEN {
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
wait until ship:apoapsis > 225000.
from {local Pitch is 45.} UNTIL Pitch = -1 STEP {set Pitch to Pitch - 0.5.} DO {
    set ap to ship:apoapsis + 833.
    if ship:apoapsis > 300000 {
         set pitch to 0.
    }
    wait until ship:apoapsis > ap.
    
    LOCK STEERING TO HEADING (Roll, Pitch).
    clearScreen.
    print "Apoapsis" + ship:apoapsis.
    print "Pitch:" + Pitch.
    print "roll:" + Roll.
}

when stage2 = true then {
    set rcs to true.
    set sas to true.
    wait until ETA:apoapsis < 60.
    SET SHIP:CONTROL:FORE to 1.
    wait 4.
    stage.
    wait until ship:periapsis > 300000.
    wait until orbit:eccentricity > 0.01.
    lock throttle to 0.
    unlock throttle.
    print "Manual Takeover!".
    set manual to true.
}
wait until manual = true.