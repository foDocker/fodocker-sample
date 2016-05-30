#!/bin/bash
sleep 10
time=2
while :
do
	for value in $(seq 0 1 100)
	do
		sleep $time
		echo "VALUE: $value"
		curl -i -XPOST "http://influxdb:8086/write?db=fodocker" --data-binary "metric2,bla=ble value=$value"
	done
	for value in $(seq 100 -1 0)
	do
		sleep $time
		echo "VALUE: $value"
		curl -i -XPOST "http://influxdb:8086/write?db=fodocker" --data-binary "metric2,bla=ble value=$value"
	done
done
