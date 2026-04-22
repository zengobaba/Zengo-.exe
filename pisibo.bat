@echo off
color 0c
title Ibrahim'in Pis Isleri

:: Baslik
echo.
echo ================================
echo      IBRAHIM'IN PIS ISLERI
echo ================================
echo.
timeout /t 2 >nul

:: 1. SORU
:QUESTION1
cls
echo Soru 1: Ilgar'in ayak numarasi kactir?
echo.
echo 1. Zoktay
echo 2. Kikirahmanaga
echo.
set /p secim1="Secimin (1-2): "

if "%secim1%"=="1" goto QUESTION2
if "%secim1%"=="2" goto WRONG1
goto QUESTION1

:WRONG1
echo Yanlis cevap! Tekrar dene...
timeout /t 2 >nul
goto QUESTION1

:: 2. SORU
:QUESTION2
cls
echo Soru 2: Ibo nasil is yapar?
echo.
echo 1. Pis
echo 2. Naime
echo.
set /p secim2="Secimin (1-2): "

if "%secim2%"=="1" goto QUESTION3
if "%secim2%"=="2" goto WRONG2
goto QUESTION2

:WRONG2
echo Yanlis cevap! Tekrar dene...
timeout /t 2 >nul
goto QUESTION2

:: 3. SORU
:QUESTION3
cls
echo Soru 3:
echo.
echo 1. Valorant gir
echo 2. Ibo ifsa
echo.
set /p secim3="Secimin (1-2): "

if "%secim3%"=="1" goto VALO
if "%secim3%"=="2" goto IFSA
goto QUESTION3

:VALO
echo Valorant aciliyor...
timeout /t 2 >nul

start "" "C:\Riot Games\Riot Client\RiotClientServices.exe" --launch-product=valorant --launch-patchline=live

goto SURPRISE

:IFSA
echo Ifsa aciliyor...
timeout /t 2 >nul
start "" "ifsa.png"
goto SURPRISE

:SURPRISE
timeout /t 2 >nul
start "" "https://www.youtube.com/watch?v=MeiE6b-PglU"
exit
