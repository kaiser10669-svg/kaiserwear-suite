@echo off
chcp 65001 > nul
echo ===================================================================
echo  WatchThermometer (Native Wear OS) - Установка на Xiaomi Watch 5
echo ===================================================================
echo.
set /p WATCH_TARGET="Введите IP:порт часов (или нажмите Enter, если часы единственное устройство): "
if not "%WATCH_TARGET%"=="" (
    echo Подключение к часам %WATCH_TARGET%...
    adb connect %WATCH_TARGET%
    adb -s %WATCH_TARGET% install -r -g WatchThermometer.apk
) else (
    adb install -r -g WatchThermometer.apk
)
if %errorlevel% neq 0 (
    echo.
    echo [ОШИБКА] Не удалось установить APK на часы.
    pause
    exit /b %errorlevel%
)
echo.
echo [УСПЕХ] Приложение Термометр успешно установлено на часы!
echo.
pause
