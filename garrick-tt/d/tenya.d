// changement de l'intervention de Garrick initiale du BG1NPC
ALTER_TRANS TENYA
BEGIN 5 END
BEGIN 3 END
BEGIN "EPILOGUE" ~EXTERN GARRIJ veutaidertenya~
END

APPEND ~GARRIJ~

	IF ~~ THEN BEGIN veutaidertenya
	  SAY @340
	  IF ~~ THEN DO ~SetGlobal("TenyaHit","GLOBAL",2)
		ChangeEnemyAlly("Tenya",NEUTRAL)
		ClearAllActions()
		SetGlobal("TenyaStory","GLOBAL",1)
		SetGlobal("gtt#tenyagarrick","GLOBAL",1)
~ UNSOLVED_JOURNAL @371 EXTERN ~TENYA~ 7
	END

END

// Garrick intervient quand on retourne voir Tenya
INTERJECT TENYA 8 gtt#garrickramenetanya2
== GARRIJ IF ~InParty("Garrick")
!Dead("Garrick")
!StateCheck("Garrick",CD_STATE_NOTVALID)
Global("gtt#tenyagarrick","GLOBAL",1)
Dead("Jebadoh")
Dead("Telman")
Dead("Sonner")~ THEN
@341
== TENYA
@343
== GARRIJ
@344
DO ~TakePartyGold(75)~
== TENYA
@345
== GARRIJ
@346
== TENYA
@347
== GARRIJ
@348
== TENYA
@349
== GARRIJ
@350
== TENYA
@351
== GARRIJ
@352
== TENYA
@353
== GARRIJ
@354
EXTERN ~TENYA~ recompense

// Garrick intervient quand on retourne voir Tenya (alternatif)
INTERJECT TENYA 8 gtt#garrickramenetanya1
== GARRIJ IF ~InParty("Garrick")
!Dead("Garrick")
!StateCheck("Garrick",CD_STATE_NOTVALID)
Global("gtt#tenyagarrick","GLOBAL",1)
PartyHasItem("MISC53")~ THEN
@342
== TENYA
@343
== GARRIJ
@344
DO ~TakePartyGold(75)~
== TENYA
@345
== GARRIJ
@346
== TENYA
@347
== GARRIJ
@348
== TENYA
@349
== GARRIJ
@350
== TENYA
@351
== GARRIJ
@352
== TENYA
@353
== GARRIJ
@354
EXTERN ~TENYA~ recompense

APPEND ~TENYA~
	IF ~~ THEN BEGIN recompense
	  SAY @355
	  IF ~~ THEN DO ~GiveItemCreate("gtt#bo","Garrick",3,0,0)
		AddXPObject("Garrick",1000)
		SetGlobal("gtt#tenyagarrick","GLOBAL",2)
		SetGlobal("gtt#aprestenya2","GLOBAL",1)
		SetGlobal("gtt#garrickabo","GLOBAL",1)~
		GOTO recompense2
	  END
END

APPEND ~TENYA~
  IF ~~ THEN BEGIN recompense2
    SAY @372
    COPY_TRANS TENYA 11
  END
END

// après le départ de Tenya, dialogue entre CHARNAME et Garrick
APPEND ~GARRIJ~

	IF WEIGHT #0 ~Global("gtt#tenyagarrick","GLOBAL",2)
	Global("gtt#aprestenya2","GLOBAL",1)~ THEN BEGIN garrickaprestenya
	  SAY @356
	  IF ~~ THEN REPLY @357 GOTO garrickaprestenyachain
	END
END

	CHAIN
	IF ~Global("gtt#tenyagarrick","GLOBAL",2)
	Global("gtt#aprestenya2","GLOBAL",1)~ THEN GARRIJ garrickaprestenyachain
	@358
	== %IMOEN_JOINED% IF ~InParty("%IMOEN_DV%")
	!Dead("%IMOEN_DV%")
	!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN
	@359
	== KAGAIJ IF ~InParty("Kagain")
	!Dead("Kagain")
	!StateCheck("Kagain",CD_STATE_NOTVALID)~ THEN
	@360
	== ELDOTJ IF ~InParty("Eldoth")
	!Dead("Eldoth")
	!StateCheck("Eldoth",CD_STATE_NOTVALID)~ THEN
	@361
	== MINSCJ IF ~InParty("Minsc")
	!Dead("Minsc")
	!StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN
	@362
	=
	@363
	=
	@364
	== %JAHEIRA_JOINED% IF ~InParty("Jaheira")
	!Dead("Jaheira")
	!StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN
	@365
	== XANJ IF ~InParty("Xan")
	!Dead("Xan")
	!StateCheck("Xan",CD_STATE_NOTVALID)~ THEN
	@366
	END
	IF ~~ GOTO garrickaprestenyachain2
	
APPEND ~GARRIJ~
	IF ~Global("gtt#tenyagarrick","GLOBAL",2)
	Global("gtt#aprestenya2","GLOBAL",1)~ THEN BEGIN garrickaprestenyachain2
	  SAY @370
	  IF ~~ THEN REPLY @367 DO ~SetGlobal("gtt#aprestenya2","GLOBAL",2)~ EXIT
	  IF ~~ THEN REPLY @368 DO ~SetGlobal("gtt#aprestenya2","GLOBAL",2)~ EXIT
	  IF ~~ THEN REPLY @369 DO ~SetGlobal("gtt#aprestenya2","GLOBAL",2)~ EXIT
	END


END
