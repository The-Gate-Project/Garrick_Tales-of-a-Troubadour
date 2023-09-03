ALTER_TRANS SILENC
BEGIN %BLOC_SILENCE_A% END
BEGIN 1 END
BEGIN
	"TRIGGER" ~InParty("Garrick")
			   !Dead("Garrick")
			   !StateCheck("Garrick",CD_STATE_NOTVALID)
			   PartyGoldGT(4)~
	"ACTION" ~TakePartyGold(5)~
	"EPILOGUE" ~GOTO tuaimelespierres~
END

EXTEND_BOTTOM SILENC %BLOC_SILENCE_A%
	IF ~Or(3)
	!InParty("Garrick")
	Dead("Garrick")
	StateCheck("Garrick",CD_STATE_NOTVALID)
	PartyGoldGT(4)~ THEN REPLY @557 DO ~TakePartyGold(5)
	StartStore("stosilen",LastTalkedToBy(Myself))~ EXIT
END

ALTER_TRANS SILENC
BEGIN %BLOC_SILENCE_B% END
BEGIN 0 END
BEGIN
	"TRIGGER" ~InParty("Garrick")
			   !Dead("Garrick")
			   !StateCheck("Garrick",CD_STATE_NOTVALID)~
	"ACTION" ~~
	"EPILOGUE" ~GOTO tuaimelespierres~
END

EXTEND_BOTTOM SILENC %BLOC_SILENCE_B%
	IF ~Or(3)
	!InParty("Garrick")
	Dead("Garrick")
	StateCheck("Garrick",CD_STATE_NOTVALID)~ THEN REPLY @557 DO ~StartStore("stosilen",LastTalkedToBy(Myself))~ EXIT
END

APPEND ~SILENC~

	IF ~~ THEN BEGIN tuaimelespierres
	  SAY @523
	  IF ~~ THEN REPLY @524 GOTO pastrop
	  IF ~~ THEN REPLY @526 GOTO cadepend
	END
	
	IF ~~ THEN BEGIN pastrop
		SAY @525
		IF ~~ THEN DO ~StartStore("stosilen",LastTalkedToBy(Myself))~ EXIT
	END
	
	IF ~~ THEN BEGIN cadepend
		SAY @527
		IF ~~ THEN REPLY @528 GOTO contreeloitaine
	END
	
	IF ~~ THEN BEGIN contreeloitaine
		SAY @529
		IF ~~ THEN DO ~StartStore("stosilen",LastTalkedToBy(Myself))~ REPLY @530 EXIT
		IF ~~ THEN REPLY @531 GOTO voirlapierre
	END
	
	IF ~~ THEN BEGIN voirlapierre
		SAY @532
		IF ~~ THEN REPLY @533 GOTO sertaquoi
	END
	
	IF ~~ THEN BEGIN sertaquoi
		SAY @534
		IF ~~ THEN REPLY @535 GOTO coutecombien
	END
	
	IF ~~ THEN BEGIN coutecombien
		SAY @536
		IF ~~ THEN REPLY @537 EXTERN ~GARRIJ~ jachete
		IF ~~ THEN REPLY @538 EXTERN ~GARRIJ~ jachete
	END
	
	IF ~~ THEN BEGIN jevendraisaunautre
		SAY @543
		IF ~~ THEN DO ~StartStore("stosilen",LastTalkedToBy(Myself))~ EXIT
	END
	
	IF ~~ THEN BEGIN voilapourvous
		SAY @546
		IF ~~ THEN DO ~GiveItemCreate("gtt#gde","Garrick",0,0,0)~ REPLY @547 EXTERN ~GARRIJ~ rougit
	END

END

APPEND ~GARRIJ~

	IF ~~ THEN BEGIN jachete
		SAY @539
		IF ~~ THEN REPLY @540 GOTO pasdesous
	END
	
	IF ~~ THEN BEGIN pasdesous
		SAY @541
		IF ~~ THEN REPLY @542 EXTERN ~SILENC~ jevendraisaunautre
		IF ~PartyGoldGT(799)~ THEN REPLY @544 GOTO mercimerci
	END
	
	IF ~~ THEN BEGIN mercimerci
		SAY @545
		IF ~~ THEN DO ~TakePartyGold(800)~ EXTERN ~SILENC~ voilapourvous
	END
	
	IF ~~ THEN BEGIN rougit
		SAY @548
		IF ~~ THEN REPLY @549 GOTO caluiferaplaisir
	END
	
	IF ~~ THEN BEGIN caluiferaplaisir
		SAY @550
		IF ~~ THEN REPLY @551 GOTO mercicharname
		IF ~~ THEN REPLY @553 GOTO pasfrequentable
		IF ~~ THEN REPLY @555 GOTO baisselatete
	END
	
	IF ~~ THEN BEGIN mercicharname
		SAY @552
		IF ~~ THEN EXIT
	END
	
	IF ~~ THEN BEGIN pasfrequentable
		SAY @554
		IF ~~ THEN EXIT
	END
	
	IF ~~ THEN BEGIN baisselatete
		SAY @556
		IF ~~ THEN EXIT
	END

END
