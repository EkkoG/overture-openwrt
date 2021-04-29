#!/bin/bash

./scripts/feeds update -a

./scripts/feeds install -a

make defconfig

make package/overture/{clean,compile} -j4 V=s