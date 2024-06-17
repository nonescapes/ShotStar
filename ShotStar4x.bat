@echo off
title ShotStar
:play
mode con cols=27 lines=16
set sec=3
set score=000
set "space= " 
echo %score% > %~dp0Bin\score4x.dll
set monster= ★
set reward=100
set color=7
color 0%COLOR%
set num16= %space% & set num26= %space% & set num36= %space% & set num46= %space%
set num15= %space% & set num25= %space% & set num35= %space% & set num45= %space%
set num14= %space% & set num24= %space% & set num34= %space% & set num44= %space%
set num13= %space% & set num23= %space% & set num33= %space% & set num43= %space%
set num12= %space% & set num22= %space% & set num32= %space% & set num42= %space%
set num11= %space% & set num21= %space% & set num31= %space% & set num41= %space%
:top
set /p highestscore=<%~dp0Bin\highestscore4x.dll 
cls
echo 分數: %score% 最高分:%highestscore%
echo=
echo=
echo=
echo            %sec%
echo=
echo=
echo -----------------------
echo shoot shoot shoot shoot
echo    v     b    n    m
echo=
echo Ver Beta 0.4
timeout /t 1 /nobreak >nul
set /a sec=sec-1
if "%sec%" == "0" goto start
goto top
:start
set /a s1=%random%%%4+1
set /a s2=%random%%%4+1
set /a s3=%random%%%4+1
set /a s4=%random%%%4+1
set /a s5=%random%%%4+1
set /a s6=%random%%%4+1
set num%s1%1=%monster%
set num%s2%2=%monster%
set num%s3%3=%monster%
set num%s4%4=%monster%
set num%s5%5=%monster%
set num%s6%6=%monster%
start /MIN /belownormal "" "%~dp0Bin\time4x.bat"
:game
set /p highestscore=<%~dp0Bin\highestscore4x.dll 
color 0%COLOR%
cls
echo 分數: %score% 最高分:%highestscore%
echo  %num16%  %num26%  %num36%  %num46%
echo  %num15%  %num25%  %num35%  %num45%
echo  %num14%  %num24%  %num34%  %num44%
echo  %num13%  %num23%  %num33%  %num43%
echo  %num12%  %num22%  %num32%  %num42%
echo  %num11%  %num21%  %num31%  %num41%
echo -----------------------
echo shoot shoot shoot shoot
echo    v    b    n    m
echo=
echo {R}重置遊戲 
echo {E}清除最高紀錄
echo {Q}離開遊戲
choice /c:asdbnmqrkevf >nul

if errorlevel 12 goto f
if errorlevel 11 goto a
if errorlevel 10 echo 000 > %~dp0Bin\highestscore4x.dll&goto game
if errorlevel 9 goto prize
if errorlevel 8 (
echo -1>%~dp0Bin\score4x.dll
for /l %%e in (1 +1 1500) do cls&echo=&echo=&echo=&echo=&echo       正在初始化中...
goto play
)
if errorlevel 7 taskkill /f /IM cmd.exe >nul
if errorlevel 6 goto f
if errorlevel 5 goto d
if errorlevel 4 goto s
if errorlevel 3 goto d
if errorlevel 2 goto s
if errorlevel 1 goto a 

:a
if not "%num11%" == "%monster%" goto delay
goto prize
:s
if not "%num21%" == "%monster%" goto delay
goto prize
:d
if not "%num31%" == "%monster%" goto delay
goto prize
:f
if not "%num41%" == "%monster%" goto delay
goto prize
:prize
set /a score=score+%reward%
echo %score% > %~dp0Bin\score4x.dll
if %score% gtr %highestscore% echo %score% > %~dp0Bin\highestscore4x.dll
if %score% == 5000 (
set color=c
set reward=200
)
if %score% == 15000 (
set color=a
set reward=300
)
if %score% == 30000 (
set color=e
set reward=400
)
if %score% == 50000 (
set color=f
set reward=1000
)

set num11=%num12%
set num21=%num22%
set num31=%num32%
set num41=%num42%

set num12=%num13%
set num22=%num23%
set num32=%num33%
set num42=%num43%

set num13=%num14%
set num23=%num24%
set num33=%num34%
set num43=%num44%

set num14=%num15%
set num24=%num25%
set num34=%num35%
set num44=%num45%

set num15=%num16%
set num25=%num26%
set num35=%num36%
set num45=%num46%

set /a r=%random%%%4+1
set num%r%6=%monster%
if "%r%" == "1" set num26= %space% & set num36= %space% & set num46= %space%
if "%r%" == "2" set num16= %space% & set num36= %space% & set num46= %space%
if "%r%" == "3" set num16= %space% & set num26= %space% & set num46= %space%
if "%r%" == "4" set num16= %space% & set num26= %space% & set num36= %space%
goto game

:delay
for /l %%n in (1 +1 400) do color 4%color%
goto game
