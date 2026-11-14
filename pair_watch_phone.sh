#!/system/bin/sh
# ==============================================================================
#  👑 KaiserWear Suite — Universal Wear OS Pairing Script for Android
#  Автор: Kaiser Dev
#  Запускается прямо на смартфоне через Bugjaeger / Termux / LADB
# ==============================================================================

echo "=================================================================="
echo " 👑 KaiserWear Suite: Перенос Wear OS на новый смартфон (Без сброса) "
echo " Автор: Kaiser Dev | Telegram: https://t.me/kaiStudi "
echo "=================================================================="
echo ""
echo "Поддержка: Xiaomi Watch, Samsung Galaxy Watch, Pixel Watch, OnePlus"
echo ""

# Будим экран часов
input keyevent 224
svc power stayon true

# Запуск универсального мастера переноса Wear OS
am start -a android.settings.WATCH_TRANSFER

echo "[ИНСТРУКЦИЯ НА ЭКРАНАХ]:"
echo "1. На часах нажмите зеленую галочку [✓] (Подтвердить перенос)."
echo "2. На смартфоне подтвердите запрос сопряжения Bluetooth."
echo ""
echo "Когда на часах появится экран «Продолжите на телефоне», выполните в консоли:"
echo "------------------------------------------------------------------"
echo "settings put secure user_setup_complete 1"
echo "am start -a android.intent.action.MAIN -c android.intent.category.HOME"
echo "------------------------------------------------------------------"
echo "Затем на часах свайпом вниз нажмите «Позже» — и часы готовы!"
echo "=================================================================="
