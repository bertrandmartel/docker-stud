# Stud Docker image

A configurable [Stud](https://github.com/bumptech/stud) docker image :

## Run

```
docker run -e CONFIG_PATH="/usr/local/etc/stud/stud.conf" \
           --network host \
           -v your_home/stud-conf:/usr/local/etc/stud bertrandmartel/docker-stud
```

## Environment variables

* configuration file path :

| variable  |  description    |  default value  |
|-----------|-----------------|--------------|
| CONFIG_PATH  |  Load configuration from specified file |   | 

* or enter each parameter :

| variable  |  description    |  default value  |
|-----------|-----------------|--------------|
| PEM_FILE  |  full chain cert path |     /usr/local/etc/stud/stud.pem | 
| FRONTEND  | fronend HOST,PORT |   [*]:6984         | 
| BACKEND   |  backend HOST,PORT |     [127.0.0.1]:5984 | 
| SSL       |    SSL state on/off | on               |
| WORKERS   | Number of worker processes |   2                |  

Example :

```
docker run --network host \
           -e "PEM_FILE=/usr/local/etc/stud/stud.pem" \
           -e "FRONTEND=[*]:4242" \
           -e "BACKEND=[127.0.0.1]:8081" \
           -e "SSL=on" \
           -e "WORKERS=4" \
           -v your_home/stud-conf:/usr/local/etc/stud bertrandmartel/docker-stud
```

## External Links

* stud : https://github.com/bumptech/stud