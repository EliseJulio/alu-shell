#!/usr/bin/env bash
# Manages the manage_my_process script

start() {
    ./manage_my_process.sh &
    echo $! > /var/run/my_process.pid
    echo "manage_my_process started"
}

stop() {
    if [ -e /var/run/my_process.pid ]; then
        kill $(cat /var/run/my_process.pid)
        rm /var/run/my_process.pid
        echo "manage_my_process stopped"
    else
        echo "manage_my_process is not running"
    fi
}

restart() {
    stop
    start
    echo "manage_my_process restarted"
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        restart
        ;;
    *)
        echo "Usage: 11-manage_my_process {start|stop|restart}"
        exit 1
        ;;
esac

