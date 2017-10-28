# espruinohub-docker-rpi
Image docker with EspruinoHub  [A BLE -> MQTT bridge for Raspberry Pi and other Embedded devices] (https://github.com/espruino/EspruinoHub)

# USAGE 

## Using docker-compose.yml (from repository)
``` 
 docker-compose up -d
```

## Using docker run
``` 
 docker run -d --name espruinohub --net=host --restart="always" --privileged humbertosales/espruinohub-docker-rpi
```

## Versions
``1.1.0 (latest)`` - Run and restart manager for cmd.sh script... RECOMENDED

``1.0.0`` - Run and restart manager for Docker... long time without adversting generate long docker restarting ...
