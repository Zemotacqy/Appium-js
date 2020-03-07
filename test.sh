#!/bin/sh 

echo "Welcome to Appium-js"
echo $ANDROID_SDK_ROOT

echo "Setting up your App"
git clone "https://github.com/$GITHUB_REPOSITORY.git"
IFS='/'
repository=$(echo "${GITHUB_REPOSITORY}" | cut -d'/' -f2)
echo "${repository}"
cd ${repository}
chmod +x ./gradlew
./gradlew assembleDebug

echo "${bs_username}"
echo "${bs_accesskey}"

echo ::set-output name=console::op
