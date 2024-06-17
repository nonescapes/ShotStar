@echo off 
set count=30
mode con cols=14 lines=2
:top
cls
echo         %count%
title  %count%
set /p check=<%~dp0score4x.dll 
if "%check%"=="-1" exit

timeout /t 1 /nobreak >nul

set /p check=<%~dp0score4x.dll 
if "%check%"=="-1" exit

set /a count=count-1
if "%count%"=="0" goto finish
goto top
:finish
set /p score=<%~dp0score4x.dll 
msg * "時間結束 ! 你的分數為:%score%分。"
set /p highestscore=<%~dp0highestscore4x.dll 
set /a "d=%highestscore%-%score%"
if %score% lss %highestscore% (
msg * "離最高分數差了%d%分!"
) else (
msg * "恭喜你刷新了最高分記錄!!!"
)
taskkill /f /IM cmd.exe >nul