CHAIN
IF WEIGHT #-1 ~InParty("Garrick")
!Dead("Garrick")
!StateCheck("Garrick",CD_STATE_NOTVALID)
InMyArea(Player1)
!StateCheck(Player1,CD_STATE_NOTVALID)
NumberOfTimesTalkedTo(0)
Global("SPRITE_IS_DEADNEIRA","GLOBAL",1)
Global("Chapter","GLOBAL",%tutu_chapter_2%)
!See([ENEMY])~ THEN INNKN2 tavernechant1
@280

== GARRIJ
@281
== INNKN2
@282
== GARRIJ
@283
== INNKN2
@284
=
@285
EXTERN ~GARRIJ~ garricktavernechant1

APPEND ~GARRIJ~

	IF ~~ THEN BEGIN garricktavernechant1
	  SAY @286
	  IF ~~ THEN REPLY @288 EXTERN ~INNKN2~ veutpasjouer
	  IF ~~ THEN DO ~SetGlobal("gtt#garrickjouenashkel","GLOBAL",1)
	  DayNight(19)
	  ClearAllActions()
	  StartCutSceneMode()
	  StartCutScene("cutjna")
	  ~ REPLY @287 EXIT
	END

END

APPEND ~INNKN2~

	IF ~~ THEN BEGIN veutpasjouer
	  SAY @289
	  IF ~~ THEN DO ~SetGlobal("gtt#garrickjouenashkel","GLOBAL",7)~ EXIT
	END
	
	IF WEIGHT #-2 ~Global("gtt#garrickjouenashkel","GLOBAL",1)~ THEN BEGIN donnetarifsreduits
		SAY @293
		IF ~~ THEN DO ~SetGlobal("gtt#garrickjouenashkel","GLOBAL",2)~ EXIT
	END

	IF WEIGHT #-3 ~Global("gtt#garrickjouenashkel","GLOBAL",2)~ THEN BEGIN tarifsreduits
	  SAY @296
	  IF ~~ THEN REPLY @297 DO ~StartStore("gtt#nas",LastTalkedToBy(Myself))
	  SetGlobal("gtt#garrickjouenashkel","GLOBAL",3)
	~ EXIT
	  IF ~~ THEN REPLY @298 EXIT
	END
	
	IF WEIGHT #-4 ~NumberOfTimesTalkedTo(0)
	Or(3)
	!InParty("Garrick")
	Dead("Garrick")
	StateCheck("Garrick",CD_STATE_NOTVALID)~ THEN BEGIN pasgarrick
	  SAY @296
	  IF ~~ THEN REPLY @297 DO ~StartStore("Inn4801",LastTalkedToBy(Myself))
	  SetGlobal("gtt#garrickjouenashkel","GLOBAL",7)
	~ EXIT
	  IF ~~ THEN REPLY @298 DO ~SetGlobal("gtt#garrickjouenashkel","GLOBAL",7)~ EXIT
	END

END
