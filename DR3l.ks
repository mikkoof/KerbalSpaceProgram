CLEARSCREEN.
//Alinine at start 202.6 + 51.8
LOCK THROTTLE TO 1.0.
PRINT "Count down".
FROM {local countdown is 4 .} UNTIL countdown = 0 STEP {SET countdown to countdown -1.} DO {
	PRINT "..." + countdown.
	WAIT 1.
}
clearScreen.

stage.  Print "5th stage engines.".
Wait 2.
stage.  Print "Liftoff!".
wait 51.7.
stage.  Print "3rd stage engines.".
wait 0.8.
stage.  Print "Side boosters decoupled.".
set flag to false.
when flag = false then {
    when stage:Aniline < 7 then {//1.4 / aerobee
        set flag to true.
        stage.  Print "1st stage engines.".
        wait 0.8.
        stage.  Print "3rd stage decoupled.".
        wait until ship:Aniline = 0.
        print ship:apoapsis.
    }
}
wait until false.