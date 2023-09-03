APPEND ~GARRIJ~

IF WEIGHT #0 ~!See([ENEMY])
AreaCheck("%Lighthouse%")
Global("gtt#pharesirenes","GLOBAL",1)~ THEN BEGIN remarquesirene2
  SAY @230
  IF ~~ THEN DO ~SetGlobal("gtt#pharesirenes","GLOBAL",2)~
  EXIT
END

END
