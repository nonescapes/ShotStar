@echo off
title ScoreShow
mode con cols=23 lines=16
:show
set /p highestscore=<%~dp0Bin\highestscore.dll 
set /p score=<%~dp0Bin\score.dll 
set /p highestscore4x=<%~dp0Bin\highestscore4x.dll 
set /p score4x=<%~dp0Bin\score4x.dll 
cls
echo        だ计琩高
echo=
echo=
echo  ---------3x---------
echo=
echo  Ω笴だ计:%score% 
echo  程蔼だ计魁:%highestscore%
echo=
echo=
echo  ---------4x---------
echo=
echo  Ω笴だ计:%score4x% 
echo  程蔼だ计魁:%highestscore4x%
pause>nul
goto show

