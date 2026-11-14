@echo off
chcp 65001 > nul
title KaiserWear Suite — Universal Wear OS Pairing Tool
color 0B
echo ==============================================================================
echo       👑 KAISERWEAR SUITE — UNIVERSAL WEAR OS PAIRING TOOL 👑
echo   Сопряжение любых часов Wear OS с OriginOS / ColorOS / HyperOS (Без сброса)
echo   Автор решения: Kaiser Dev ^| Telegram: https://t.me/kaiStudi
echo ==============================================================================
echo.

set "ADB=adb"
if exist "%~dp0tools\adb.exe" set "ADB=%~dp0tools\adb.exe"

echo Поддерживаемые часы:
echo   • Xiaomi Watch 5 / Watch 2 / Watch 2 Pro
echo   • Samsung Galaxy Watch 4 / 5 / 6 / 7 / Ultra
echo   • Google Pixel Watch 1 / 2 / 3
echo   • OnePlus Watch 2 / 2R, OPPO Watch X
echo   • Mobvoi TicWatch Pro 3 / 5
echo.
echo ------------------------------------------------------------------------------
echo 1. Включите на часах "Отладку по Wi-Fi" (Настройки -> Для разработчиков).
echo 2. Убедитесь, что часы и ПК находятся в одной Wi-Fi сети.
echo ------------------------------------------------------------------------------
echo.
set /p WATCH_IP="Введите IP:порт часов (например, 192.168.1.57:5555): "
if "%WATCH_IP%"=="" (
    echo [ОШИБКА] IP-адрес часов не указан!
    pause
    exit /b 1
)

echo.
echo [1/4] Подключение к часам %WATCH_IP% через ADB...
"%ADB%" connect %WATCH_IP%

echo.
echo [2/4] Активация универсального мастера переноса Wear OS...
"%ADB%" -s %WATCH_IP% shell input keyevent 224
"%ADB%" -s %WATCH_IP% shell svc power stayon true
"%ADB%" -s %WATCH_IP% shell am start -a android.settings.WATCH_TRANSFER

echo.
echo ==============================================================================
echo [3/4] ПОДТВЕРЖДЕНИЕ НА ЭКРАНАХ:
echo   1. На экране часов нажмите зеленую галочку [✓] (Подтвердить перенос).
echo   2. На смартфоне откройте приложение-компаньон (Mi Fitness, Galaxy Wearable и др.)
echo      или меню Bluetooth и подтвердите сопряжение!
echo ==============================================================================
echo.
echo Как только на часах появится надпись «Продолжите на телефоне»,
echo нажмите ЛЮБУЮ КЛАВИШУ здесь, чтобы мгновенно снять блокировку...
pause > nul

echo.
echo [4/4] Снятие экрана настройки и переход на рабочий циферблат...
"%ADB%" -s %WATCH_IP% shell settings put secure user_setup_complete 1
"%ADB%" -s %WATCH_IP% shell am start -a android.intent.action.MAIN -c android.intent.category.HOME

echo.
echo ==============================================================================
echo [УСПЕХ!] Взгляните на часы:
echo Свайпом пролистните экран вниз и нажмите кнопку «Позже».
echo Часы мгновенно перейдут на циферблат и будут полностью подключены к телефону!
echo Telegram сообщество и обновления: https://t.me/kaiStudi
echo ==============================================================================
echo.
pause
