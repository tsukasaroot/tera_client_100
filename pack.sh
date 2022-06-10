#!/bin/bash

if [ -z "$1" ]; then
  echo "Args can't be empty, give strings (EUR, FRA, GER, RUS)"
  exit
fi

if [ ! -d "release" ]; then
  mkdir release
fi

if [ "$1" == '-a' ]; then
  if [ -f "EUR/unpack/DataCenter.xsd" ]; then
    rsync -rtv datasheets/* EUR/unpack/
    echo -e "\nCopying system sheets to EUR done\n"
    php minify.php EUR/unpack
    ./novadrop-dc.exe pack EUR/unpack/ release/DataCenter_Final_EUR.dat
  else
    echo -e "\nEUR/unpack/DataCenter.xsd doesn't exist, assuming no DC unpacked for it"
  fi
  if [ -f "FRA/unpack/DataCenter.xsd" ]; then
    rsync -rtv datasheets/* FRA/unpack/
    echo -e "\nCopying system sheets to FRA done\n"
    php minify.php FRA/unpack
    ./novadrop-dc.exe pack FRA/unpack/ release/DataCenter_Final_FRA.dat
  else
    echo -e "\nFRA/unpack/DataCenter.xsd doesn't exist, assuming no DC unpacked for it"
  fi
  if [ -f "GER/unpack/DataCenter.xsd" ]; then
    rsync -rtv datasheets/* GER/unpack/
    echo -e "\nCopying system sheets to GER done\n"
    php minify.php GER/unpack
    ./novadrop-dc.exe pack GER/unpack/ release/DataCenter_Final_GER.dat
  else
    echo -e "\nGER/unpack/DataCenter.xsd doesn't exist, assuming no DC unpacked for it"
  fi
  if [ -f "RUS/unpack/DataCenter.xsd" ]; then
    rsync -rtv datasheets/* RUS/unpack/
    echo -e "\nCopying system sheets to RUS done\n"
    php minify.php RUS/unpack
    ./novadrop-dc.exe pack RUS/unpack/ release/DataCenter_Final_RUS.dat
  else
    echo -e "\nRUS/unpack/DataCenter.xsd doesn't exist, assuming no DC unpacked for it"
  fi
else
  rsync -rtv datasheets/* "$1"/unpack/
  ./novadrop-dc.exe pack "$1"/unpack/ saved-"$1".dat
fi
