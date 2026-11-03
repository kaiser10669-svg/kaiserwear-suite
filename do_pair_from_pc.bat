@echo off
chcp 65001 > nul
echo ===================================================================
echo   Перенос Xiaomi Watch 5 на Vivo X300 Ultra (OriginOS)
echo   Автор метода: Kaiser Dev
echo ===================================================================
echo.

set "ADB=adb"
if exist "%~dp0tools\adb.exe" set "ADB=%~dp0tools\adb.exe"

echo 1. Убедитесь, что на часах включена "Отладка по Wi-Fi".
echo 2. Часы и ПК должны быть в одной Wi-Fi сети.
echo.
set /p WATCH_IP="Введите IP:порт часов (например, 192.168.1.57:5555): "
if "%WATCH_IP%"=="" (
    echo [ОШИБКА] IP-адрес часов не указан!
    pause
    exit /b 1
)

echo.
echo [1/4] Подключение к часам %WATCH_IP%...
"%ADB%" connect %WATCH_IP%

echo.
echo [2/4] Активация мастера переноса Wear OS на часах...
"%ADB%" -s %WATCH_IP% shell input keyevent 224
"%ADB%" -s %WATCH_IP% shell svc power stayon true
"%ADB%" -s %WATCH_IP% shell am start -a android.settings.WATCH_TRANSFER

echo.
echo ===================================================================
echo [3/4] ПОДТВЕРЖДЕНИЕ НА ЭКРАНАХ:
echo 1. На экране часов нажмите зеленую галочку [✓] (Подтвердить перенос).
echo 2. На смартфоне Vivo откройте Mi Fitness MOD v4 или меню Bluetooth.
echo 3. В появившемся запросе сопряжения нажмите «Подключить»!
echo ===================================================================
echo.
echo Как только на часах появится надпись «Продолжите на телефоне»,
echo нажмите ЛЮБУЮ КЛАВИШУ здесь, чтобы мгновенно снять блокировку...
pause > nul

echo.
echo [4/4] Снятие зависания и переход на главный циферблат...
"%ADB%" -s %WATCH_IP% shell settings put secure user_setup_complete 1
"%ADB%" -s %WATCH_IP% shell am start -a android.intent.action.MAIN -c android.intent.category.HOME

echo.
echo ===================================================================
echo [ГОТОВО!] Взгляните на часы:
echo Свайпом пролистните экран вниз и нажмите кнопку «Позже».
echo Часы выйдут на циферблат и будут полностью подключены к Vivo!
echo ===================================================================
echo.
pause
