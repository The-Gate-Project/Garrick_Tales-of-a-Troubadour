INTERJECT BELTBRD 11 gtt#garrickfinbg1
== GARRIJ IF ~InParty("Garrick")
!Dead("Garrick")
!StateCheck("Garrick",CD_STATE_NOTVALID)
Global("gtt#tenyapropositiongarrick","GLOBAL",1)~ THEN
@570
EXTERN ~GARRIJ~ finbg1jepars

APPEND ~GARRIJ~

	IF ~~ THEN BEGIN finbg1jepars
		SAY @571
		IF ~~ THEN REPLY @572 GOTO vousallezmemanquer
		IF ~~ THEN REPLY @575 GOTO especedetraitre
	END
	
	IF ~~ THEN BEGIN vousallezmemanquer
		SAY @573
		IF ~~ THEN DO ~SetGlobal("gtt#garrickarejointtenya","GLOBAL",1)
//		DestroyItem("gtt#bo")
//		DestroyItem("gtt#fl")
//		DestroyItem("gtt#fl2")
		DestroyItem("gtt#gde")
//		DestroyItem("gtt#vio")
		DestroyItem("gtt#vvv")
//		DestroyItem("x#garch2")
//		DestroyItem("x#garch")
		LeaveParty()
		EscapeAreaDestroy(90)~ REPLY @574 EXTERN ~BELTBRD~ 11
	END
	
	IF ~~ THEN BEGIN especedetraitre
		SAY @576
		IF ~~ THEN REPLY @577 GOTO especedetraitre2
	END
	
	IF ~~ THEN BEGIN especedetraitre2
		SAY @578
		IF ~~ THEN DO ~SetGlobal("gtt#garrickarejointtenya","GLOBAL",1)
//		DestroyItem("gtt#bo")
//		DestroyItem("gtt#fl")
//		DestroyItem("gtt#fl2")
		DestroyItem("gtt#gde")
//		DestroyItem("gtt#vio")
		DestroyItem("gtt#vvv")
//		DestroyItem("x#garch2")
//		DestroyItem("x#garch")
		LeaveParty()
		EscapeAreaDestroy(90)~ EXTERN ~BELTBRD~ 11
	END

END
