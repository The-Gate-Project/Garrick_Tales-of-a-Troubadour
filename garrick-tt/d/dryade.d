INTERJECT_COPY_TRANS2 DRYAD 6 gtt#dryadegarrick1
== GARRIJ IF ~InParty("Garrick")
!Dead("Garrick")
!StateCheck("Garrick",STATE_SLEEPING)
Global("AskedDryad","GLOBAL",0)
PartyHasItem("gtt#fl")~ THEN
@170
== DRYAD
@171
== GARRIJ
@172
== DRYAD
@173
=
@174
== GARRIJ
@175
== DRYAD
@176
=
@177
DO ~GiveItemCreate("gtt#fl2","Garrick",2,0,0)
SetGlobalTimer("gtt#tpsavantdryad2","GLOBAL",TWO_DAYS)
TakePartyItem("gtt#fl")
DestroyItem("gtt#fl")~
END

// dialogue quand on retourne voir la dryade
CHAIN
IF WEIGHT #-2 ~InParty("Garrick")
!Dead("Garrick")
!StateCheck("Garrick",STATE_SLEEPING)
Global("AskedDryad","GLOBAL",0)
Global("gtt#dryadegarrick1","GLOBAL",1)
PartyHasItem("gtt#fl2")
Global("gtt#creadryad2","GLOBAL",1)
Global("gtt#baiserdryade","GLOBAL",0)~ THEN DRYAD dryadegarrick2
@180
=
@181
=
@182
== GARRIJ
@183
DO ~AddSpecialAbility("gtt#bd")
DisplayStringHead("Garrick",@184)
SetGlobal("gtt#baiserdryade","GLOBAL",1)~
EXIT

APPEND ~DRYAD~
IF WEIGHT #-1 ~Global("gtt#creadryad2","GLOBAL",1)~ THEN BEGIN hellodryad2
  SAY @180
  IF ~~ THEN DO ~~
  EXIT
END
END
