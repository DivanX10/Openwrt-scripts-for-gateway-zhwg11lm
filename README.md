# Обновляем\даунгрейд OpenWRT на шлюзе Aqara ZHWG11LM

-------
__Владельцам шлюза Xiaomi DGNWG05LM [сюда](https://github.com/DivanX10/Openwrt-scripts-for-gateway-dgnwg05lm)__

__Ответы на вопросы в разделе [WiKi](https://github.com/DivanX10/Openwrt-scripts-for-gateway-zhwg11lm/wiki)__

--------
Выражаю благодарность [Ivan Belokobylskiy](https://github.com/devbis) и [mr G1K](https://github.com/G1K) за помощь в обновлении и даунгрейде OpenWRT. 

**Проект Open Lumi Gateway**

https://github.com/openlumi

**Исходники**

1) https://openlumi.github.io/releases/

2) https://github.com/openlumi/releases/tree/2b87c8a6a5610e238b5b9748b8e461790c7c7919


**Release of OpenWrt 21.02.0 for Xiaomi DGNWG05LM and Aqara ZHWG11LM**

https://github.com/openlumi/openwrt/releases

**Группа Xiaomi Gateway hack в телеграм**

https://t.me/xiaomi_gw_hack

Для удобства я создал скрипты, которые помогут вам обновить OpenWRT с версии 19.07 до 21.02 или сделать даунгрейд OpenWRT с версии 21.02 до 19.07. После того, как скрипт отработает, то шлюз перезагрузится и ждем, когда поднимется точка доступа с именем OpenWRT. Настройте подключение к роутеру WiFi.

**Внимание! Перед запуском скрипта, обязательно сделайте резервную копию шлюза**
----
**Шлюз Aqara ZHWG11LM**

Обновляем OpenWRT с версии 19.07 до 21.02
```
wget https://raw.githubusercontent.com/DivanX10/Openwrt-scripts-for-gateway-zhwg11lm/main/scripts/aqara_zhwg11lm_update_openwrt_21.sh -O - | sh
```
Даунгрейд OpenWRT с версии 21.02 до 19.07
```
wget https://raw.githubusercontent.com/DivanX10/Openwrt-scripts-for-gateway-zhwg11lm/main/scripts/aqara_zhwg11lm_downgrade_openwrt_19.sh -O - | sh
```
----
__Полный бэкап вручную, через консоль__

Бэкап будет лежать в папке /tmp
```
tar cvz -f /tmp/backup_$(date +%d-%m-20%y_%H-%M).tar.gz -C /overlay/upper/ /overlay/upper/
```
__Удаление всех файлов и сброс шлюза к заводским настройкам__
```
rm -rf /overlay/upper/.* /overlay/upper/* && reboot
```
----

**Базовый набор пакетов после сброса OpenWRT до заводских настроек**

Этот скрипт упрощает первоначальную настройку после сброса OpenWRT до заводских настроек. У вас должен быть бэкап всех настроек и когда скрипт установит базовый набор пакетов, то вам нужно закинуть свои настройки в zigbee2mqtt, в mosquitto и т.д. По сути этот скрипт избавит после сброса шлюза до заводских настроек ставить пакеты, такие как mosquitto, zigbee2mqtt, lumimqtt, mpd и т.д

В базовый набор входят пакеты:
 
 ```
  mc - Файловый менеджер Midnight Commander
  nano - Текстовый редактор Nano
  lumimqtt - MQTT agent for Xiaomi Lumi gateway. Ставится lumimqtt и копируется конфигурационный файлик lumimqtt.json в /etc/
  mpd-full - Music Player Daemon. Создается папка MPD в корне с подпапками music и playlists + копируется готовый конфигурационный файл с настройками MPD
  mosquitto-nossl - MQTT брокер
  node - Node Js - это платформа на основе JavaScript
  node-zigbee2mqtt - Установка Zigbee2mqtt + добавление готового конфига для прошивки c baudrate 1000000
  sshpass - Неинтерактивный вход по SSH
  libssh - SSH библиотека
  libssh2-1 - SSH библиотека
  openssh-sftp-client - Позволяет осуществлять доступ по протоколу SFTP
  openssh-client-utils - В данном пакете содержатся пакеты openssh-client, openssh-keygen
  luci-theme-bootstrap - LuCI themes, верхняя панель будет по центру, вместо уехавшей панели вправо
  htop - монитор процессов в консоли
  python3-pymysql - это библиотека PyMySQL позволяющая подключиться в MySQL
```

> Важно! Если у вас возникли проблемы во время установки или после запуска скрипта не все пакеты установились, значит у вас не настроены фиды. Читаем эти статьи

* [У меня не ставятся пакеты или установились не все пакеты](https://github.com/DivanX10/Openwrt-scripts-for-gateway-zhwg11lm/wiki/У-меня-не-ставятся-пакеты-или-установились-не-все-пакеты)
* [При установке базовых пакетов возникают ошибки](https://github.com/DivanX10/Openwrt-scripts-for-gateway-zhwg11lm/wiki/При-установке-базовых-пакетов-возникают-ошибки)

```
wget https://raw.githubusercontent.com/DivanX10/Openwrt-scripts-for-gateway-zhwg11lm/main/scripts/initial_installation_for_openwrt.sh -O - | sh
```



