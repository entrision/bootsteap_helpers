#!/bin/bash

FIRST=`pwd`

cd /tmp/
git clone https://github.com/twbs/icons.git
cd icons/icons/
cp *.svg $FIRST/icons/

cd $FIRST
