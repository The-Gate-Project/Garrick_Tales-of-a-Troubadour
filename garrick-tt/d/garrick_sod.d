// dialogue avec Garrick dans SoD

APPEND ~BDGARRIJ~

	IF WEIGHT #-1 ~Global("gtt#tenyapropositiongarrick","GLOBAL",1)
	Global("gtt#garricksod","GLOBAL",0)
	OR(2)
	Dead("bdkorlas")
        Global("BD_KORLASZ_SURRENDER","GLOBAL",1)
        !Dead("Garrick")
        !StateCheck("Garrick",CD_STATE_NOTVALID)~ THEN BEGIN finsod
		SAY @570
		IF ~~ THEN DO ~SetGlobal("gtt#garricksod","GLOBAL",1)~ GOTO finbg1jepars
	END
	
	IF ~Global("gtt#garricksod","GLOBAL",1)~ THEN BEGIN finbg1jepars
		SAY @571
		IF ~~ THEN REPLY @572 GOTO vousallezmemanquer
		IF ~~ THEN REPLY @575 GOTO especedetraitre
	END
	
	IF ~Global("gtt#garricksod","GLOBAL",1)~ THEN BEGIN vousallezmemanquer
		SAY @573
		IF ~~ THEN DO ~SetGlobal("gtt#garrickarejointtenya","GLOBAL",1)
		DestroyItem("gtt#bo")
		DestroyItem("gtt#fl")
		DestroyItem("gtt#fl2")
		DestroyItem("gtt#gde")
		DestroyItem("gtt#vio")
		DestroyItem("gtt#vvv")
		DestroyItem("x#garch2")
		DestroyItem("x#garch")
		SetGlobal("gtt#garricksod","GLOBAL",2)
		LeaveParty()
		EscapeAreaDestroy(90)~ REPLY @574 EXIT
	END
	
	IF ~Global("gtt#garricksod","GLOBAL",1)~ THEN BEGIN especedetraitre
		SAY @576
		IF ~~ THEN REPLY @577 GOTO especedetraitre2
	END
	
	IF ~Global("gtt#garricksod","GLOBAL",1)~ THEN BEGIN especedetraitre2
		SAY @578
		IF ~~ THEN DO ~SetGlobal("gtt#garrickarejointtenya","GLOBAL",1)
		DestroyItem("gtt#bo")
		DestroyItem("gtt#fl")
		DestroyItem("gtt#fl2")
		DestroyItem("gtt#gde")
		DestroyItem("gtt#vio")
		DestroyItem("gtt#vvv")
		DestroyItem("x#garch2")
		DestroyItem("x#garch")
		SetGlobal("gtt#garricksod","GLOBAL",2)
		LeaveParty()
		EscapeAreaDestroy(90)~ EXIT
	END

END
