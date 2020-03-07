#!/bin/sh 

echo "Welcome to Appium-js"
echo $ANDROID_SDK_ROOT

echo "Setting up your App"
git clone "https://github.com/$GITHUB_REPOSITORY.git"
IFS='/'
read -ra repository <<< "$GITHUB_REPOSITORY"
cd ${repository[1]}
chmod +x ./gradlew
./gradlew assembleDebug

echo "${bs_username}"
echo "${bs_accesskey}"

echo ::set-output name=console::op
