CHAIN
IF WEIGHT #-1 ~InParty("Garrick")
!Dead("Garrick")
!StateCheck("Garrick",CD_STATE_NOTVALID)
Global("FirebeadDone","GLOBAL",1)
!Global("gtt#garrickflute","GLOBAL",1)
AreaCheck("%Beregost_FirebeadsHouse_L1%")~ THEN GARRIJ garrickflute
@120
== FIREBE
@121
== GARRIJ
@122
== FIREBE
@123
== GARRIJ
@124
== FIREBE
@125
== GARRIJ
@126
== KAGAIJ IF ~InParty("Kagain")
!Dead("Kagain")
!StateCheck("Kagain",CD_STATE_NOTVALID)~ THEN
@127
== FIREBE
@128
== GARRIJ
@129
== FIREBE
@130
== GARRIJ
@131
== FIREBE
@132
== %VICONIA_JOINED% IF ~InParty("Viconia")
!Dead("Viconia")
!StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN
@133
== GARRIJ
@134
== FIREBE
@135
== GARRIJ
@136
== FIREBE
@137
== GARRIJ
@138
=
@139
=
@140
=
@141
== FIREBE
@142
== GARRIJ
@143
== FIREBE
@144
== %JAHEIRA_JOINED% IF ~InParty("Jaheira")
!Dead("Jaheira")
!StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN
@145
== FIREBE
@146
=
@147
== GARRIJ
@148
== FIREBE
@149
== GARRIJ
@150
== FIREBE
@151
== GARRIJ
@152
DO ~GiveItemCreate("gtt#fl","Garrick",1,0,0)
SetGlobal("gtt#garrickflute","GLOBAL",1)~
== FIREBE
@153
== %IMOEN_JOINED% IF ~InParty("%IMOEN_DV%")
!Dead("%IMOEN_DV%")
!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN
@154
EXIT
