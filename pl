#!/usr/bin/env bash

for path in ${@}; do
    adb push "${path}" "/system/lib"
done
