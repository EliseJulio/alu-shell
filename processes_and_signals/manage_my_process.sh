#!/usr/bin/env bash
# Indefinitely writes "I am alive!" to the file /tmp/my_process with a pause
while true; do
    echo "I am alive!" >> /tmp/my_process
    sleep 2
done

