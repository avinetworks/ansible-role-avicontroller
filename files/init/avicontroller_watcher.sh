#!/bin/bash

while true
do
  service avicontroller start
  sleep 1
  docker wait avicontroller
  sleep 1
  docker rm -f avicontroller
  sleep 1
done
