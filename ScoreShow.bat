@echo off
title ScoreShow
mode con cols=23 lines=16
:show
set /p highestscore=<%~dp0Bin\highestscore.dll 
set /p score=<%~dp0Bin\score.dll 
set /p highestscore4x=<%~dp0Bin\highestscore4x.dll 
set /p score4x=<%~dp0Bin\score4x.dll 
cls
echo        ���Ƭd��
echo=
echo=
echo  ---------3x---------
echo=
echo  �W���C������:%score% 
echo  �̰����Ƭ���:%highestscore%
echo=
echo=
echo  ---------4x---------
echo=
echo  �W���C������:%score4x% 
echo  �̰����Ƭ���:%highestscore4x%
pause>nul
goto show

