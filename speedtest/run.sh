#!/bin/sh

#docker run --rm -it gists/speedtest-cli 



#docker run -it -v /opt/docker/speedtest/data:/root/.config gists/speedtest-cli speedtest 
#docker run -it -v /opt/docker/speedtest/data:/root/.config gists/speedtest-cli speedtest -h
#docker run -it -v /opt/docker/speedtest/data:/root/.config gists/speedtest-cli speedtest -f csv 
speedjson=`docker run -it -v /opt/docker/speedtest/data:/root/.config gists/speedtest-cli speedtest -f json`
#docker run -it gists/speedtest-cli sh
#
#

latency=`echo $speedjson | jq -r '.ping' | jq -r '.latency'`
download=`echo $speedjson | jq -r '.download' | jq -r '.bandwidth'`
upload=`echo $speedjson | jq -r '.upload' | jq -r '.bandwidth'`

dl=`echo $download*8/1000000 | bc ` 
ul=`echo $upload*8/1000000 | bc ` 
echo "Latency = $latency, Download = $dl Mbit/s, Upload = $ul MBit/s"
