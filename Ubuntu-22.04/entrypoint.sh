#!/bin/bash

service ssh start
service jupyter start

service prometheus start
service prometheus-node-exporter start
service nvidia_gpu_exporter start
service grafana-server start

tail -f /dev/null

