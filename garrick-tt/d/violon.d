APPEND ~GARRIJ~

	IF WEIGHT #0 ~AreaCheck("GTT#01")
	PartyHasItem("gtt#vvv")
	Global("gtt#garrickviolon1","GLOBAL",1)~ THEN BEGIN garrickviolon1
	  SAY @242
	  IF ~~ THEN DO ~SetGlobal("gtt#garrickviolon1","GLOBAL",2)~
	  EXIT
	END

END

APPEND ~FALDOJ~

	IF WEIGHT #0 ~AreaCheck("GTT#01")
	Global("gtt#faldornbarbare","GLOBAL",1)~ THEN BEGIN faldornbarbare
	  SAY @241
	  IF ~~ THEN DO ~SetGlobal("gtt#faldornbarbare","GLOBAL",2)~
	  EXIT
	END

END

// Haute-Haie
EXTEND_BOTTOM THALAN 1
	IF ~PartyHasItem("gtt#vvv")
	Global("gtt#thalanviolon","GLOBAL",0)
	~ THEN REPLY @250 GOTO thalanviolon
END

EXTEND_BOTTOM THALAN 35
	IF ~PartyHasItem("gtt#vvv")
	Global("gtt#thalanviolon","GLOBAL",0)
	~ THEN REPLY @250 GOTO thalanviolon
END

APPEND ~THALAN~

	IF ~PartyHasItem("gtt#vvv")
	Global("gtt#thalanviolon","GLOBAL",0)~ THEN BEGIN thalanviolon
		SAY @251
		IF ~~ THEN GOTO thalanviolon2
	END

	IF ~~ THEN BEGIN thalanviolon2
		SAY @252
		IF ~~ THEN DO ~SetGlobal("gtt#thalanviolon","GLOBAL",1)~ REPLY @253
		EXIT
END

END

// Toubazar Drin : on lui parle du violon pour la première fois
EXTEND_BOTTOM HALBAZ 0
	IF ~PartyHasItem("gtt#vvv")
	Global("gtt#drinviolon","GLOBAL",0)
	~ THEN REPLY @260 GOTO drinviolon
END

APPEND ~HALBAZ~

	IF ~PartyHasItem("gtt#vvv")
	Global("gtt#drinviolon","GLOBAL",0)~ THEN BEGIN drinviolon
		SAY @261
		IF ~PartyGoldGT(19999)~ THEN DO ~TakePartyGold(20000)~ REPLY @262 GOTO vareparer
		IF ~PartyGoldLT(20000)~ THEN REPLY @266 GOTO pasargent
		IF ~~ THEN REPLY @264 GOTO veuxpas
	END
// ok pour la réparation
	IF ~~ THEN BEGIN vareparer
		SAY @263
		IF ~~ THEN DO ~TakePartyItem("gtt#vvv")
		DestroyItem("gtt#vvv")
		SetGlobal("gtt#drinviolon","GLOBAL",1)
		SetGlobal("gtt#reparviolon","GLOBAL",1)
		SetGlobalTimer("gtt#tpsavantfinviolon","GLOBAL",TEN_DAYS)~ EXIT
	END
// CHARNAME est pauvre
	IF ~~ THEN BEGIN pasargent
		SAY @267
		IF ~~ THEN DO ~SetGlobal("gtt#drinviolon","GLOBAL",1)~ EXIT
	END
// CHARNAME n'aime pas le violon
	IF ~~ THEN BEGIN veuxpas
		SAY @265
		IF ~~ THEN DO ~SetGlobal("gtt#drinviolon","GLOBAL",1)~ EXIT
	END

END

// on lui parle du violon pour la deuxième fois
EXTEND_BOTTOM HALBAZ 0
	IF ~Global("gtt#drinviolon","GLOBAL",1)
	!PartyHasItem("gtt#vvv")
	Global("gtt#reparviolon","GLOBAL",1)
	!GlobalTimerExpired("gtt#tpsavantfinviolon","GLOBAL")~ THEN REPLY @268 GOTO etatviolon
	IF ~Global("gtt#drinviolon","GLOBAL",1)
	PartyHasItem("gtt#vvv")
	Global("gtt#reparviolon","GLOBAL",0)~ THEN REPLY @268 GOTO retourviolon
END

APPEND ~HALBAZ~
	// réparation fini !
	IF WEIGHT #-1 ~Global("gtt#drinviolon","GLOBAL",1)
	!PartyHasItem("gtt#vvv")
	Global("gtt#reparviolon","GLOBAL",1)
	GlobalTimerExpired("gtt#tpsavantfinviolon","GLOBAL")~ THEN BEGIN violonfini
	  SAY @274
	  IF ~InParty("Garrick")
	  !Dead("Garrick")
	  !StateCheck("Garrick",CD_STATE_NOTVALID)~ THEN DO ~SetGlobal("gtt#drinviolon","GLOBAL",2)
	  GiveItemCreate("gtt#vio",LastTalkedToBy,1,0,0)~ EXTERN ~GARRIJ~ garviolonfini
	  IF ~~ THEN DO ~SetGlobal("gtt#drinviolon","GLOBAL",2)
	  GiveItemCreate("gtt#vio",LastTalkedToBy,1,0,0)~
	  EXIT
	END

// soit patient !
	IF ~~ THEN BEGIN etatviolon
		SAY @269
		IF ~~ DO ~~ EXIT
	END
// tu veux finalement réparer : as-tu l'argent ?
	IF ~~ THEN BEGIN retourviolon
		SAY @270
		IF ~PartyGoldGT(19999)~ THEN DO ~TakePartyGold(20000)~ REPLY @271 GOTO vareparer
		IF ~~ THEN REPLY @272 GOTO moquepas
	END
// tu veux finalement réparer : rigolo !
	IF ~~ THEN BEGIN moquepas
		SAY @273
		IF ~~ THEN DO ~~ EXIT
	END

END

APPEND ~GARRIJ~

IF ~~ THEN BEGIN garviolonfini
  SAY @275
  IF ~~ THEN DO ~~
  EXIT
END

END
