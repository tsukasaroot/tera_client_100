#!/bin/bash

if [ -z "$1" ]; then
        echo "Args can't be empty, give strings (EUR, FRA, GER, RUS)"
        exit;
fi

if [ "$1" == '-a' ]; then
	if [ -f "EUR/unpack/DataCenter.xsd" ]; then
	        rsync -rtv datasheets/* EUR/unpack/
		echo "\nCopying system sheets to EUR done\n"
		./novadrop-dc.exe pack EUR/unpack/ release/DataCenter_Final_EUR.dat
	else
		echo "EUR/unpack/DataCenter.xsd doesn't exist, assuming no DC unpacked for it"
	fi
        if [ -f "FRA/unpack/DataCenter.xsd" ]; then
                rsync -rtv datasheets/* FRA/unpack/
                echo "\nCopying system sheets to FRA done\n"
		./novadrop-dc.exe pack FRA/unpack/ release/DataCenter_Final_FRA.dat
        else
                echo "FRA/unpack/DataCenter.xsd doesn't exist, assuming no DC unpacked for it"
        fi
        if [ -f "GER/unpack/DataCenter.xsd" ]; then
                rsync -rtv datasheets/* GER/unpack/
                echo "\nCopying system sheets to GER done\n"
		./novadrop-dc.exe pack GER/unpack/ release/DataCenter_Final_GER.dat
        else
                echo "GER/unpack/DataCenter.xsd doesn't exist, assuming no DC unpacked for it"
        fi
        if [ -f "RUS/unpack/DataCenter.xsd" ]; then
                rsync -rtv datasheets/* RUS/unpack/
                echo "\nCopying system sheets to RUS done\n"
		./novadrop-dc.exe pack RUS/unpack/ release/DataCenter_Final_RUS.dat
        else
                echo "RUS/unpack/DataCenter.xsd doesn't exist, assuming no DC unpacked for it"
        fi
else
        rsync -rtv datasheets/* "$1"/unpack/
        ./novadrop-dc.exe pack "$1"/unpack/ saved-"$1".dat
fi
