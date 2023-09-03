APPEND ~GARRIJ~

IF WEIGHT #-1 ~Global("DaemonCultFinish","GLOBAL",1)
	Global("gtt#garrickaecletec","GLOBAL",1)~ THEN BEGIN garrickaecletec
  SAY @310
  IF ~~ THEN DO ~SetGlobal("gtt#garrickaecletec","GLOBAL",2)~
  EXIT
END



END
