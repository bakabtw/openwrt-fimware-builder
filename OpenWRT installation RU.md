# Устанавливаем зависимости
```
git clone https://github.com/acecilia/OpenWRTInvasion
cd OpenWRTInvasion/
pip3 install -r requirements.txt
```

# Запускаем скрипт
```
python3 remote_command_execution_vulnerability.py
```

Скрипт запросит IP роутера (`192.168.31.1`) и пароль.

Роутер подготовлен к прошивке.

# Подключаемся по telnet
```
telnet 192.168.31.1
```

Логин: **root**

Пароль: **root**


# Скачиваем прошивку
```
wget -O /tmp/openwrt.bin -c https://files.payload.network/openwrt-23.05.0-ramips-mt76x8-xiaomi_mi-router-4c-squashfs-sysupgrade.bin
```

NB: только **http** и **ftp** протоколы поддерживаются.

# Устанавливаем прошивку
```
mtd -r write /tmp/openwrt.bin OS1
```