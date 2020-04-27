#!/bin/bash

halDir="/Library/Audio/Plug-Ins/HAL"

if [ ! -d $halDir ];then
mkdir $halDir
else
echo "HAL folder exist"
fi