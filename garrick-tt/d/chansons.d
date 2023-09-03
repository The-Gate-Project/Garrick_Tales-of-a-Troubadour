EXTEND_BOTTOM GARRIJ %nbdiaggarrcharname%
	IF ~Or(3)
	Global("gtt#ChansonIvrogne","GLOBAL",1)
	Global("gtt#ChansonSirenes","GLOBAL",1)
	Global("gtt#BalladeNainFou","GLOBAL",1)
	~ THEN REPLY @320 GOTO choixchanson
END

APPEND ~GARRIJ~

	IF ~~ THEN BEGIN choixchanson
		SAY @321
		IF ~~ THEN REPLY @322 GOTO expliquechantbataille
		IF ~Global("gtt#ChansonSirenes","GLOBAL",1)~ THEN REPLY @323 GOTO expliquechansonsirenes
		IF ~Global("gtt#ChansonIvrogne","GLOBAL",1)~ THEN REPLY @324 GOTO expliquechansonivrogne
		IF ~Global("gtt#BalladeNainFou","GLOBAL",1)~ THEN REPLY @325 GOTO expliqueballadenainfou
		IF ~~ THEN REPLY @330 EXIT
	END

	IF ~~ THEN BEGIN expliquechantbataille
		SAY @326
		IF ~~ THEN GOTO choixchanson
	END
	
	IF ~~ THEN BEGIN expliquechansonsirenes
		SAY @327
		IF ~~ THEN GOTO choixchanson
	END
	
	IF ~~ THEN BEGIN expliquechansonivrogne
		SAY @328
		IF ~~ THEN GOTO choixchanson
	END
	
	IF ~~ THEN BEGIN expliqueballadenainfou
		SAY @329
		IF ~~ THEN GOTO choixchanson
	END



END
