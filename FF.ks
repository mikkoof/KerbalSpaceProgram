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
stage.
Wait 0.8.
stage.
set flag to false.
when flag = false then {
    when stage:Aniline < 0.1 then {
        set flag to true.
        print "flag: true".
    }
}
when flag = true then {
    wait until ship:altitude < 4000.
    stage.
}
wait until false.