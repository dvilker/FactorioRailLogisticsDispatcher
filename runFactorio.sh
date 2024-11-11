#!/bin/bash
set -e

cd build
./build.js
cd ..

/Applications/factorio.app/Contents/MacOS/factorio "$@" | sed "s#__RailLogisticsDispatcher__#$(pwd)#g"