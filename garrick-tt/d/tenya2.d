// Tenya (append)
APPEND ~TENYA2~

// dialogue quand Tenya BG1 est fini
	IF WEIGHT #-6 ~Global("gtt#tenyabg1fini","GLOBAL",1)~ THEN BEGIN toutok
	  SAY @486
	  IF ~~ THEN GOTO jepeuxquelquechosepourvous
	END
	
	IF ~~ THEN BEGIN jepeuxquelquechosepourvous
	  SAY @487
	  IF ~Global("HelpTremain","GLOBAL",1)
	  Global("BOYBODY","GLOBAL",0)~ THEN REPLY @489 GOTO corpstremain
	  IF ~~ THEN REPLY @488 EXIT
	END
	
	IF ~~ THEN BEGIN corpstremain
	  SAY @490
	  IF ~~ THEN DO ~SetGlobal("BOYBODY","GLOBAL",1)
		GiveItemCreate("MISC54",LastTalkedToBy,0,0,0)~ UNSOLVED_JOURNAL @491 EXIT
	END

// dialogue quand la quête du prêtre de Talos est finie
	IF WEIGHT #-5 ~Global("gtt#tenyapretretalosencours","GLOBAL",1)
	Dead("ENRIACK")~ THEN BEGIN talosfait
	  SAY @460
	  IF ~~ THEN REPLY @461 GOTO pasincapable
	END
	
	IF ~~ THEN BEGIN pasincapable
	  SAY @462
	  IF ~~ THEN DO ~SetGlobal("gtt#tenyabg1fini","GLOBAL",1)
	  EraseJournalEntry(@482)~ SOLVED_JOURNAL @483 REPLY @463 GOTO ouipars
	  IF ~~ THEN DO ~SetGlobal("gtt#tenyabg1fini","GLOBAL",1)
	  EraseJournalEntry(@482)~ SOLVED_JOURNAL @483 REPLY @465 GOTO recompense
	END
	
	IF ~~ THEN BEGIN ouipars
	  SAY @464
	  IF ~InParty("Garrick")
		!Dead("Garrick")
		!StateCheck("Garrick",CD_STATE_NOTVALID)~ THEN GOTO propositionpourgarrick0
	  IF ~~ THEN EXIT
	END
	
	IF ~~ THEN BEGIN recompense
	  SAY @466
	  IF ~~ THEN REPLY @467 GOTO recompense2
	END
	
	IF ~~ THEN BEGIN recompense2
	  SAY @468
	  IF ~InParty("Garrick")
		!Dead("Garrick")
		!StateCheck("Garrick",CD_STATE_NOTVALID)~ THEN GOTO propositionpourgarrick0
	  IF ~~ THEN EXIT
	END
	
	IF ~~ THEN BEGIN propositionpourgarrick0
	  SAY @485
	  IF ~~ THEN EXTERN ~GARRIJ~ propositionpourgarrick
	END

// dialogue quand la quête du prêtre de Talos est en cours
	IF WEIGHT #-4 ~Global("gtt#tenyapretretalosencours","GLOBAL",1)
	!Dead("ENRIACK")~ THEN BEGIN vafairetalos
	  SAY @459
	  IF ~~ THEN EXIT
	END

// dialogue quand la quête de la sirène est finie, propose la quête du prêtre de Talos
	IF WEIGHT #-3 ~Global("gtt#tenyasireneencours","GLOBAL",1)
	Dead("LARRIA")
	Global("gtt#tenyapretretalosencours","GLOBAL",0)~ THEN BEGIN sirenefait
	  SAY @432
	  IF ~~ THEN REPLY @433 GOTO tenyafachee
	END
	
	IF ~~ THEN BEGIN tenyafachee
	  SAY @434
	  IF ~InParty("Garrick")
		!Dead("Garrick")
		!StateCheck("Garrick",CD_STATE_NOTVALID)
		Global("gtt#benedictionlarriaz","GLOBAL",1)~ THEN EXTERN ~GARRIJ~ moijaichante
	  IF ~Or(4)
	  Global("gtt#benedictionlarriaz","GLOBAL",0)
	  !InParty("Garrick")
	  Dead("Garrick")
	  StateCheck("Garrick",CD_STATE_NOTVALID)~ THEN REPLY @436 GOTO tenyafachee2
	END
	
	IF ~~ THEN BEGIN tenyafachee2
	  SAY @437
	  IF ~~ THEN GOTO tenyafachee3
	END
	
	IF ~~ THEN BEGIN tenyafachee3
	  SAY @438
	  IF ~InParty("Jaheira")
		!Dead("Jaheira")
		!StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN EXTERN ~%JAHEIRA_JOINED%~ jaheirafachee
	  IF ~~ THEN REPLY @440 EXTERN ~TENYA2~ tenyaattaque
	  IF ~~ THEN REPLY @441 EXTERN ~TENYA2~ humilite
	END
	
	IF ~~ THEN BEGIN humilite
	  SAY @442
	  IF ~~ THEN GOTO priereumberlie
	END
	
	IF ~~ THEN BEGIN priereumberlie
	  SAY @443
	  IF ~~ THEN DO ~PlaySound("CAS_M07")~ GOTO douleur
	END
	
	IF ~~ THEN BEGIN douleur
	  SAY @444
	  IF ~~ THEN DO ~ForceSpellRES("GTT#VU",Player1)~ GOTO pertepv
	END
	
	IF ~~ THEN BEGIN pertepv
	  SAY @445
	  IF ~~ THEN GOTO ricane
	END
	
	IF ~~ THEN BEGIN ricane
	  SAY @446
	  IF ~~ THEN GOTO expliquepretretalos
	END


// dialogue quand la quête de la sirène est en cours
	IF WEIGHT #-2 ~Global("gtt#tenyasireneencours","GLOBAL",1)
	!Dead("LARRIA")~ THEN BEGIN vafairesirene
	  SAY @431
	  IF ~~ THEN EXIT
	END


// dialogue initial, qui propose la quête de la sirène OU celle du prêtre de Talos
	IF WEIGHT #-1 ~InParty("Garrick")
	!Dead("Garrick")
	!StateCheck("Garrick",CD_STATE_NOTVALID)
	Global("gtt#tenyagarrick","GLOBAL",2)
	Global("gtt#tenyasireneencours","GLOBAL",0)~ THEN BEGIN tenya2avecgarrick
	  SAY @400
	  IF ~~ THEN EXTERN ~GARRIJ~ tenya2avecgarrick1
	END
	
	IF ~~ THEN BEGIN tenya2avecgarrick2
	  SAY @402
	  IF ~~ THEN REPLY @403 EXTERN ~GARRIJ~ tenya2avecgarrick2_1
	  IF ~OR(4)
	  ReputationGT(Player1,15)
	  Alignment(Player1,LAWFUL_GOOD)
	  Alignment(Player1,NEUTRAL_GOOD)
	  Alignment(Player1,CHAOTIC_GOOD)~ THEN REPLY @406 GOTO genscommemoigentil
	  IF ~ReputationLT(Player1,16)
	  !Alignment(Player1,LAWFUL_GOOD)
	  !Alignment(Player1,NEUTRAL_GOOD)
	  !Alignment(Player1,CHAOTIC_GOOD)~ THEN REPLY @406 GOTO genscommemoimechantt
	END
	
	IF ~~ THEN BEGIN genscommemoimechantt
	  SAY @407
	  IF ~~ THEN EXTERN ~GARRIJ~ genscommemoimechant
	END
	
	IF ~~ THEN BEGIN genscommemoigentil
	  SAY @410
	  IF ~~ THEN REPLY @411 GOTO genscommemoigentil2
	END
	
	IF ~~ THEN BEGIN genscommemoigentil2
	  SAY @412
	  IF ~CheckStatGT(Player1,16,CHR)~ THEN REPLY @413 GOTO genscommemoigentil2_1
	  IF ~~ THEN REPLY @414 GOTO genscommemoigentil2_2
	END
	
	IF ~~ THEN BEGIN genscommemoigentil2_1
	  SAY @419
	  IF ~!Dead("LARRIA")~ THEN GOTO expliquegarrick
	  IF ~Dead("LARRIA")~ THEN GOTO expliquepretretalos
	END
	
	IF ~~ THEN BEGIN genscommemoigentil2_2
	  SAY @415
	  IF ~~ THEN REPLY @416 GOTO genscommemoigentil2_3
	  IF ~CheckStatGT(Player1,14,INT)
	  CheckStatGT(Player1,14,WIS)~ THEN REPLY @420 GOTO genscommemoigentilfache
	END
	
	IF ~~ THEN BEGIN genscommemoigentilfache
	  SAY @421
	  IF ~~ THEN GOTO genscommemoigentil2_1
	END
	
	IF ~~ THEN BEGIN genscommemoigentil2_3
	  SAY @417
	  IF ~~ THEN GOTO genscommemoigentildegoute
	END
	
	IF ~~ THEN BEGIN genscommemoigentildegoute
	  SAY @418
	  IF ~~ THEN GOTO genscommemoigentil2_1
	END
	
	
	IF ~~ THEN BEGIN tenya2avecgarrick2_11
	  SAY @405
	  IF ~!Dead("LARRIA")~ THEN GOTO expliquegarrick
	  IF ~Dead("LARRIA")~ THEN GOTO expliquepretretalos
	END
	
	IF ~~ THEN BEGIN genscommemoimechant2
	  SAY @409
	  IF ~!Dead("LARRIA")~ THEN GOTO expliquegarrick
	  IF ~Dead("LARRIA")~ THEN GOTO expliquepretretalos
	END
	
	IF ~~ THEN BEGIN tenya2finexpliquesirene
	  SAY @425
	  IF ~~ THEN DO ~SetGlobal("gtt#tenyasireneencours","GLOBAL",1)~ REPLY @426 UNSOLVED_JOURNAL @427 EXIT
	  IF ~~ THEN REPLY @429 GOTO tenyaattaque
	END
	
	IF ~~ THEN BEGIN tenyaattaque
	  SAY @430
	  IF ~~ THEN DO ~Shout(1)
	  Enemy()
	  ReallyForceSpell(Myself,CLERIC_IRONSKIN)
	  ReallyForceSpell(Player1,CLERIC_SYMBOL_FEAR)
	  ReallyForceSpell(Player1,CLERIC_CONFUSION)
	  ~ EXIT
	END
	
	IF ~~ THEN BEGIN pasdecevoir
	  SAY @484
	  IF ~~ THEN REPLY @452 UNSOLVED_JOURNAL @482 GOTO ignorance
	END
		
	IF ~~ THEN BEGIN ignorance
	  SAY @453
	  IF ~InParty("Garrick")
		!Dead("Garrick")
		!StateCheck("Garrick",CD_STATE_NOTVALID)~ THEN EXTERN ~GARRIJ~ hommedemain
		IF ~~ THEN GOTO detailspratiques
	END
	
	IF ~~ THEN BEGIN decu
	  SAY @455
	  IF ~~ THEN GOTO decu2
	END
	
	IF ~~ THEN BEGIN decu2
	  SAY @456
	  IF ~~ THEN GOTO detailspratiques
	END
	
	IF ~~ THEN BEGIN detailspratiques
	  SAY @457
	  IF ~~ THEN GOTO dernierechose
	END
	
	IF ~~ THEN BEGIN dernierechose
	  SAY @458
	  IF ~~ THEN DO ~SetGlobal("gtt#tenyapretretalosencours","GLOBAL",1)~ EXIT
	END
	
	
END

// Tenya (chain)

// cadeau pour Tenya
CHAIN
	IF WEIGHT #-8 ~Global("gtt#tenyacadeaugde","GLOBAL",0)
	InParty("Garrick")
	!Dead("Garrick")
	!StateCheck("Garrick",CD_STATE_NOTVALID)
	PartyHasItem("gtt#gde")~ THEN TENYA2 cadeautenya
	@560
	== GARRIJ
	@561
	== TENYA2
	@562
	== GARRIJ
	@563
	== TENYA2
	@564
	DO ~TakePartyItem("gtt#gde")
	DestroyItem("gtt#gde")~
	== GARRIJ
	@565
	== TENYA2
	@566
	== GARRIJ
	@567
	DO ~SetGlobal("gtt#tenyacadeaugde","GLOBAL",1)~
	== TENYA2
	@568
	EXIT

CHAIN
	IF WEIGHT #-7 ~Global("gtt#tenyapropositiongarrick","GLOBAL",1)
	Global("gtt#tenyabg1fini","GLOBAL",1)
	InParty("Garrick")
	!Dead("Garrick")
	!StateCheck("Garrick",CD_STATE_NOTVALID)~ THEN TENYA2 ouenestgarrick
	@479
	== GARRIJ
	@480
	== TENYA2
	@481
	EXTERN ~TENYA2~ jepeuxquelquechosepourvous

CHAIN
	IF ~~ THEN TENYA2 propositionpourgarrickchain
	@470
	== GARRIJ
	@471
	== TENYA2
	@472
	== GARRIJ
	@473
	== TENYA2
	@474
	== GARRIJ
	@475
	== TENYA2
	@476
	== GARRIJ
	@477
	DO ~SetGlobal("gtt#tenyapropositiongarrick","GLOBAL",1)~
	== TENYA2
	@478
	EXIT

CHAIN
	IF ~~ THEN TENYA2 expliquegarrick
	@422
	== EDWINJ IF ~InParty("Edwin")
	!Dead("Edwin")
	!StateCheck("Edwin",STATE_SLEEPING)~ THEN
	@423
	== GARRIJ
	@424
	EXTERN ~TENYA2~ tenya2finexpliquesirene
	
CHAIN
	IF ~~ THEN TENYA2 expliquepretretalos
	@447
	== TENYA2
	@448
	== %IMOEN_JOINED% IF ~InParty("%IMOEN_DV%")
	!Dead("%IMOEN_DV%")
	!StateCheck("%IMOEN_DV%",STATE_SLEEPING)~ THEN
	@449
	== KHALIJ IF ~InParty("%IMOEN_DV%")
	!Dead("%IMOEN_DV%")
	!StateCheck("%IMOEN_DV%",STATE_SLEEPING)
	InParty("Khalid")
	!Dead("Khalid")
	!StateCheck("Khalid",STATE_SLEEPING)~ THEN
	@450
	== %IMOEN_JOINED% IF ~InParty("%IMOEN_DV%")
	!Dead("%IMOEN_DV%")
	!StateCheck("%IMOEN_DV%",STATE_SLEEPING)
	InParty("Khalid")
	!Dead("Khalid")
	!StateCheck("Khalid",STATE_SLEEPING)~ THEN
	@451
	EXTERN ~TENYA2~ pasdecevoir

// Garrick (append)
APPEND ~GARRIJ~
	IF ~~ THEN BEGIN tenya2avecgarrick1
	  SAY @401
	  IF ~~ THEN EXTERN ~TENYA2~ tenya2avecgarrick2
	END
	
	IF ~~ THEN BEGIN tenya2avecgarrick2_1
	  SAY @404
	  IF ~~ THEN EXTERN ~TENYA2~ tenya2avecgarrick2_11
	END
	
	IF ~~ THEN BEGIN genscommemoimechant
	  SAY @408
	  IF ~~ THEN EXTERN ~TENYA2~ genscommemoimechant2
	END
	
	IF ~~ THEN BEGIN moijaichante
	  SAY @435
	  IF ~~ THEN REPLY @436 EXTERN ~TENYA2~ tenyafachee2
	END
	
	IF ~~ THEN BEGIN hommedemain
	  SAY @454
	  IF ~~ THEN EXTERN ~TENYA2~ decu
	END
	
	IF ~~ THEN BEGIN propositionpourgarrick
	  SAY @469
	  IF ~~ THEN EXTERN ~TENYA2~ propositionpourgarrickchain
	END
	
END

// Jaheira (append)
APPEND ~%JAHEIRA_JOINED%~
	IF ~~ THEN BEGIN jaheirafachee
		SAY @439
		IF ~~ THEN REPLY @440 EXTERN ~TENYA2~ tenyaattaque
		IF ~~ THEN REPLY @441 EXTERN ~TENYA2~ humilite
	END

END
