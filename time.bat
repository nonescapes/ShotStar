@echo off 
set count=30
mode con cols=14 lines=2
:top
cls
echo         %count%
title  %count%
set /p check=<%~dp0score.dll 
if "%check%"=="-1" exit

timeout /t 1 /nobreak >nul

set /p check=<%~dp0score.dll 
if "%check%"=="-1" exit

set /a count=count-1
if "%count%"=="0" goto finish
goto top
:finish
set /p score=<%~dp0score.dll 
msg * "�ɶ����� ! �A�����Ƭ�:%score%���C"
set /p highestscore=<%~dp0highestscore.dll 
set /a "d=%highestscore%-%score%"
if %score% lss %highestscore% (
msg * "���̰����Ʈt�F%d%��!"
) else (
msg * "���ߧA��s�F�̰����O��!!!"
)
taskkill /f /IM cmd.exe >nul