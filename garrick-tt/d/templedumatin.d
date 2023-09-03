APPEND ~GARRIJ~

IF WEIGHT #0 ~!See([ENEMY])
AreaCheck("%Temple_SongoftheMorning%")
Global("gtt#templesirenes","GLOBAL",1)~ THEN BEGIN remarquesirene
  SAY @220
  IF ~~ THEN DO ~SetGlobal("gtt#templesirenes","GLOBAL",2)~
  EXIT
END

END
