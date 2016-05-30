#!/bin/bash
sleep 10
time=2
i=0
while sleep $time
do
	value=$(perl -le "print (((sin($i/100) + 1) / 2) * 100)")
	echo "VALUE: $value"
	curl -i -XPOST "http://influxdb:8086/write?db=fodocker" --data-binary "metric2,bla=ble value=$value"
	i=$(expr $i + 1)
done
