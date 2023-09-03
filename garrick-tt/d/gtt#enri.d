BEGIN ~gtt#enri~

IF ~True()~ THEN BEGIN 0
	  SAY @501
	  IF ~~ THEN REPLY @502 GOTO 2
	END
	
	IF ~~ THEN BEGIN 2
	  SAY @503
	  IF ~~ THEN REPLY @504 GOTO 3
	END
	
	IF ~~ THEN BEGIN 3
	  SAY @505
	  IF ~~ THEN DO ~Enemy()
	  CreateVisualEffect("SHEARTH",[928.429])
	  CreateVisualEffect("SHEARTH",[963.530])
	  CreateCreature("gtt#ser",[928.429],0)
	  CreateCreature("gtt#ser",[963.530],0)
	  ForceSpellRES("gtt#bou",Myself)
	  ForceSpellRES("gtt#ecl",Lastseenby(Myself))~ EXIT
	END
