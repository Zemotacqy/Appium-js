#!/bin/sh 

echo "Welcome to Appium-js"
echo $ANDROID_HOME
echo $ANDROID_SDK_ROOT

echo $GITHUB_REPOSITORY

export BS_USERNAME=$INPUT_BS_USERNAME
export BS_ACCESSKEY=$INPUT_BS_ACCESSKEY
echo "${BS_USERNAME}"
echo ::set-output name=console::op
