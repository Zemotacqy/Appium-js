FROM node:10

RUN apt-get update && apt-get install -y \
    openjdk-8-jdk unzip git

RUN mkdir android

RUN cd android &&  \
    wget https://dl.google.com/android/repository/commandlinetools-linux-6200805_latest.zip && \
    unzip commandlinetools-linux-6200805_latest.zip

ENV ANDROID_SDK_ROOT='/android'

RUN yes | /android/tools/bin/sdkmanager --sdk_root=/android --licenses

RUN npm install wd

COPY test.sh /test.sh

ENTRYPOINT [ "/test.sh" ]