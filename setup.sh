#!/bin/sh -e

wget http://dl.google.com/android/android-sdk_r24.3.4-linux.tgz
tar -xf android-sdk_r24.3.4-linux.tgz

./android-sdk-linux/tools/android update sdk -t android-17,platform-tools,build-tools-23.0.0,sys-img-armeabi-v7a-addon-google_apis-google-23 --no-ui

wget http://dl.google.com/android/ndk/android-ndk-r10e-linux-x86_64.bin
chmod +x android-ndk-r10e-linux-x86_64.bin

./android-ndk-r10e-linux-x86_64.bin