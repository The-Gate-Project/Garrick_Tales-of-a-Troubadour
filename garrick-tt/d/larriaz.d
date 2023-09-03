ALTER_TRANS LARRIA
BEGIN 1 END
BEGIN 0 END
BEGIN
	"TRIGGER" ~Global("gtt#tenyasireneencours","GLOBAL",1)~
	"ACTION" ~EraseJournalEntry(@427) Enemy()~
	"SOLVED_JOURNAL" ~@428~
END

EXTEND_BOTTOM LARRIA 1
	IF ~Global("gtt#tenyasireneencours","GLOBAL",0)~ THEN DO ~Enemy()~ EXIT
END

INTERJECT LARRIA 5 gtt#larriagarrick1
== GARRIJ IF ~InParty("Garrick")
!Dead("Garrick")
!StateCheck("Garrick",CD_STATE_NOTVALID)
Global("gtt#ChansonSirenes","GLOBAL",1)~ THEN
@301
== LARRIA
@302
== GARRIJ
@303
== LARRIA
@304
== GARRIJ
@305
EXTERN ~LARRIA~ benedictionlarriaz


APPEND ~LARRIA~
IF ~~ THEN BEGIN benedictionlarriaz
	  SAY @306
	  IF ~Global("gtt#tenyasireneencours","GLOBAL",0)~ THEN DO ~ForceSpellRES("GTT#SIR","Garrick")
	  Kill("LARRIA")
	  SetGlobal("gtt#benedictionlarriaz","GLOBAL",1)~ EXIT
	  IF ~Global("gtt#tenyasireneencours","GLOBAL",1)~ THEN DO ~EraseJournalEntry(@427)
	  ForceSpellRES("GTT#SIR","Garrick")
	  Kill("LARRIA")
	  SetGlobal("gtt#benedictionlarriaz","GLOBAL",1)~ SOLVED_JOURNAL @428 EXIT
	END
END
