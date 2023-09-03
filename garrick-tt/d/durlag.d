// dialogue 1, une fois la Tour de Durlag terminée
CHAIN
IF WEIGHT #-1 ~InParty("Garrick")
!Dead("Garrick")
!StateCheck("Garrick",STATE_SLEEPING)
Global("DurlagFinish","GLOBAL",1)
Global("gtt#durlagtimer1active","GLOBAL",1)
Global("gtt#diagchansonnainfou1","GLOBAL",1)~ THEN GARRIJ diagchansonnainfou1
@190
DO ~SetGlobal("gtt#diagchansonnainfou1","GLOBAL",2)
SetGlobalTimer("gtt#durlagtimer2","GLOBAL",TWO_DAYS)~
=
@191
== YESLIJ IF ~InParty("Yeslick")
!Dead("Yeslick")
!StateCheck("Yeslick",STATE_SLEEPING)~ THEN
@192
EXIT

// dialogue 2, deux jours après
CHAIN
IF WEIGHT #0 ~InParty("Garrick")
!Dead("Garrick")
!StateCheck("Garrick",STATE_SLEEPING)
Global("gtt#diagchansonnainfou1","GLOBAL",2)
Global("gtt#diagchansonnainfou2","GLOBAL",1)~ THEN GARRIJ diagchansonnainfou2
@193
DO ~SetGlobal("gtt#diagchansonnainfou2","GLOBAL",2)~
== YESLIJ IF ~InParty("Yeslick")
!Dead("Yeslick")
!StateCheck("Yeslick",STATE_SLEEPING)~ THEN
@194
END
IF ~~ GOTO diagchansonnainfou21

APPEND ~GARRIJ~

IF ~~ THEN BEGIN diagchansonnainfou21
  SAY @195
  IF ~~ THEN REPLY @196 GOTO chansonnainfououi
  IF ~~ THEN REPLY @198 GOTO chansonnainfounon
END

IF ~~ THEN BEGIN chansonnainfououi
  SAY @197
  IF ~!HaveSpellRES("gtt#sno")~ THEN DO ~SetGlobal("gtt#BalladeNainFou","GLOBAL",1)
  AddSpecialAbility("gtt#sno")
  AddSpecialAbility("gtt#s2a")
  DisplayStringHead(Myself,@200)~ GOTO tuto_chant
  IF ~HaveSpellRES("gtt#sno") ~ THEN DO ~AddSpecialAbility("gtt#s2a")
  SetGlobal("gtt#BalladeNainFou","GLOBAL",1)
  DisplayStringHead(Myself,@200)~ EXIT
END

IF ~~ THEN BEGIN chansonnainfounon
  SAY @199
  IF ~~ THEN DO ~~
  EXIT
END

IF ~~ THEN BEGIN tuto_chant
  SAY @100
  IF ~~ THEN DO ~SetGlobal("gtt#tuto_chant","GLOBAL",1)~
  EXIT
END

IF WEIGHT #0 ~AreaCheck("%Lighthouse%")
Global("gtt#tutosirenes","GLOBAL",1)~ THEN BEGIN tuto_chant2
  SAY @100
  IF ~~ THEN DO ~SetGlobal("gtt#tuto_chant","GLOBAL",1)~
  EXIT
END

END
