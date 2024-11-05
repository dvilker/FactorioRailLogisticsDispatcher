#!/bin/bash
set -e

cd build
./build.js
cd ..

/Applications/factorio.app/Contents/MacOS/factorio --load-game 000 | sed "s#__RailLogisticsDispatcher__#$(pwd)#g"