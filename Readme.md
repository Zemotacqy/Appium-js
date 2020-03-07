# Appium-js-GitHub-Action

## Parameters
Make sure that these parameters are required as [Github Secrets](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets)
| Parameter | Type | Description |
|-----------|------|-------------|
| `BS_USERNAME` | `string` | Your Browserstack Username |
| `BS_ACCESSKEY` | `string` | Your Browserstack Access Key |

## Requirements
For this action to execute successfully:
- Make sure you push the android app source code to GitHub.
- There is an `appium` folder in the root directory which contains a javascript file for testing.
- Push the `gradlew`, this will be used to build the apk.

## Usage
Sample Snippet for `/.github/workflows/main.yml`
```
on: [push]

jobs:
    appium_job:
        runs-on: ubuntu-latest
        name: Run Appium Test
        steps:
        - name: Appium Test step
          id: Appium
          uses: Zemotacqy/Appium-js@v2.0
          env: 
            bs_username: ${{ secrets.BS_USERNAME }}
            bs_accesskey: ${{ secrets.BS_ACCESSKEY }}  
```

You can refer to this [Sample App](https://github.com/Zemotacqy/Sample-Appium-js) for your reference.
