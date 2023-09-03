// Utilisé juste pour BGEE
EXTEND_BOTTOM PUMBERL 0
	IF ~!Dead("Tenya")
		Global("TalkedToTenya","GLOBAL",1)
		Global("TENAPPEAR","GLOBAL",0)
		Global("TremainQuest","GLOBAL",0)
		Global("gtt#tenyagarrick","GLOBAL",2)
	~ THEN REPLY @399 GOTO 7
END
