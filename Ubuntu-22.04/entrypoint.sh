#!/bin/bash

rm -r /var/lib/prometheus/metrics2/*
ulimit -n 64000

service ssh start
service jupyter start

service prometheus start
service prometheus-node-exporter start
service nvidia_gpu_exporter start
service grafana-server start

tail -f /dev/null

