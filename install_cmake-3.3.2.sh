#!/bin/bash
if [ ! -d cmake-3.3.2 ];then
 tar xzvf cmake-3.3.2.tar.gz
fi
cd cmake-3.3.2
./bootstrap && gmake && gmake install && cd ..
