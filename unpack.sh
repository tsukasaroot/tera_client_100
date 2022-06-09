#!/bin/bash

NAME=DataCenter_Final_

if [ -f  "$NAME""EUR.dat" ]; then
	./novadrop-dc.exe unpack "$NAME"EUR.dat EUR/unpack/
else
	echo "$NAME""EUR.dat doesn't exist"
fi

if [ -f  "$NAME""FRA.dat" ]; then
        ./novadrop-dc.exe unpack "$NAME"FRA.dat FRA/unpack/
else
        echo "$NAME""FRA.dat doesn't exist"
fi

if [ -f  "$NAME""GER.dat" ]; then
        ./novadrop-dc.exe unpack "$NAME"GER.dat GER/unpack/
else
        echo "$NAME""GER.dat doesn't exist"
fi

if [ -f  "$NAME""RUS.dat" ]; then
        ./novadrop-dc.exe unpack "$NAME"RUS.dat RUS/unpack/
else
        echo "$NAME""RUS.dat doesn't exist"
fi
