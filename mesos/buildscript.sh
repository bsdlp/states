#!/usr/bin/env bash

mkdir build
cd build
../configure
make -j{{ salt['grains.get']('num_cpus') }}
make check && make install
