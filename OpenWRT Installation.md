# Устанавливаем зависимости
```
git clone https://github.com/acecilia/OpenWRTInvasion
cd OpenWRTInvasion/
pip install -r requirements.txt
```

# Заходим в веб интерфейс, копируем значение `stok`
![img](https://github.com/acecilia/OpenWRTInvasion/raw/master/readme/readme-001.png)


# Запускаем скрипт
```
python3 remote_command_execution_vulnerability.py
```

Скрипт запросит IP роутера (`192.168.31.1`) и `stok`.

Роутер подготовлен к прошивке.

# Подключаемся по telnet
```
telnet 192.168.31.1
```

Логин: **root**

Пароль: **<пусто>**


# Скачиваем прошивку
```
wget -O /tmp/openwrt.bin -c https://files.payload.network/openwrt-23.05.0-ramips-mt76x8-xiaomi_mi-router-4c-squashfs-sysupgrade.bin
```

# Устанавливаем прошивку
```
mtd -r write /tmp/openwrt.bin
```