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

app_url=$(curl -u "${bs_username}:${bs_accesskey}" -X POST "https://api-cloud.browserstack.com/app-automate/upload" -F "file=@${PWD}/app/build/outputs/apk/debug/app-debug.apk" | jq '.app_url')

sed -i "s/<APP_HASHED_ID>/${app_url}/g" appium/test.js
cat appium/test.js
# sed -i "s/<BSTACK_USERNAME>/${bs_username}/g" appium/test.js
# sed -i "s/<BSTACK_ACCESS_KEY>/${bs_accesskey}/g" appium/test.js

# node appium/test.js

echo ::set-output name=console::op
