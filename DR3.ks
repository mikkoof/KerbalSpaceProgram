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
    when stage:Aniline < 4.2 then {//1.4 / aerobee
        set flag to true.
        //print "flag: true".
        stage. print"//Aerobee2.".
        wait 0.8.
        stage. print"//separator2.".
        wait until ship:Aniline = 0.
        print ship:apoapsis.
    }
}
wait until false.