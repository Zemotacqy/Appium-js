#!/bin/sh 

echo "Initiating Test..."

echo "Cloning App"
git clone "https://github.com/$GITHUB_REPOSITORY.git"

# Get the repository Name from URL
IFS='/'
repository=$(echo "${GITHUB_REPOSITORY}" | cut -d'/' -f2)

# Builds the APK
cd ${repository}
chmod +x ./gradlew
./gradlew assembleDebug

# Upload app to Browserstack
app_url=$(curl -u "${bs_username}:${bs_accesskey}" -X POST "https://api-cloud.browserstack.com/app-automate/upload" -F "file=@${PWD}/app/build/outputs/apk/debug/app-debug.apk" | jq '.app_url')
temp=$(echo "${app_url}" | cut -d'/' -f3) # Gets the hashed_id
hashed_id="${temp%\"}" # Removes quotes from end of string

# Replace variables in tests
sed -i "s/<APP_HASHED_ID>/${hashed_id}/g" appium/test.js
sed -i "s/<BSTACK_USERNAME>/${bs_username}/g" appium/test.js
sed -i "s/<BSTACK_ACCESS_KEY>/${bs_accesskey}/g" appium/test.js

# Run the test
node appium/test.js

op='Test Successfully Executed.'
echo ::set-output name=console::op
