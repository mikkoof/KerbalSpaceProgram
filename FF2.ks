CLEARSCREEN.
//Alinine at start 202.6 + 51.8
LOCK THROTTLE TO 1.0.
PRINT "Count down".
FROM {local countdown is 4 .} UNTIL countdown = 0 STEP {SET countdown to countdown -1.} DO {
	PRINT "..." + countdown.
	WAIT 1.
}
clearScreen.
print "Liftoff!".
stage. print"//solid rocket. Aerobee1. clamp.".
Wait 0.8.
stage. print"//separator1.".
set flag to false.
when flag = false then {
    when stage:Aniline < 0.9 then { //0.9 
        set flag to true.
        //print "flag: true".
        stage. print"//Aerobee2.".
        wait 0.8.
        stage. print"//separator2.".
        WAIT UNTIL ETA:APOAPSIS < 5.
        stage. print"//separator3.".
    }
}

when flag = true then {
    wait until ship:altitude < 4000.
    stage. print"//Parachute".
}
wait until false.