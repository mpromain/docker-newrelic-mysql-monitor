# Docker Redis plugin for mysql

Plugin page: https://github.com/newrelic-platform/newrelic_mysql_java_plugin

# Install
## 1. Download and create config dir
```
$ docker run \
    --volume /set/your/local/path/config:/etc/newrelic-mysql-plugin/config \
    --detach \
    --restart always \
    --name newrelic-mysql-monitor \
    mpromain/newrelic-mysql-monitor
```
## 2. Setup config files
```
$ vim config/newrelic.json
$ vim config/plugin.json
```

## 3. Run proccess
```
$ docker restart newrelic-mysql-monitor
```

### 4. Check running
```
$ docker ps
CONTAINER ID    IMAGE                               CREATED         STATUS          NAMES
113ee6d7098c    mpromain/newrelic-mysql-monitor     15 minutes ago  Up 30 seconds   newrelic-mysql-monitor
```


Enjoy!
------
