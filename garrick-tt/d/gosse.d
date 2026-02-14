APPEND ~GARRIJ~

IF ~~ THEN BEGIN tuto_chant
  SAY @100
  IF ~~ THEN DO ~SetGlobal("gtt#tuto_chant","GLOBAL",1)~
  EXIT
END

IF ~~ THEN BEGIN chansonivrogne
  SAY @111
  IF ~!HaveSpellRES("gtt#sno")~ THEN DO ~SetGlobal("gtt#ChansonIvrogne","GLOBAL",1)
  AddSpecialAbility("gtt#sno")
  AddSpecialAbility("gtt#s1a")
  DisplayStringHead(Myself,@112)~ GOTO tuto_chant
  IF ~HaveSpellRES("gtt#sno") ~ THEN DO ~AddSpecialAbility("gtt#s1a")
  SetGlobal("gtt#ChansonIvrogne","GLOBAL",1)
  DisplayStringHead(Myself,@112)~ EXIT
END


END

// dialogue avec l'ivrogne Gosse et Garrick, pour apprendre la chanson de l'ivrogne
CHAIN
IF WEIGHT #-1 ~InParty("Garrick")
!Dead("Garrick")
!StateCheck("Garrick",CD_STATE_NOTVALID)
Global("gtt#ChansonIvrogne","GLOBAL",0)~ THEN WHELP chantivrogne
@101

== GARRIJ
@102
== WHELP
@103
== GARRIJ
@104
== WHELP
@105
== GARRIJ
@106
== WHELP
@107
== GARRIJ
@113
== WHELP
@108
== GARRIJ
@109
== WHELP
@110
EXTERN ~GARRIJ~ chansonivrogne
