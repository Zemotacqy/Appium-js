FROM node:10

RUN npm install wd

COPY test.sh /test.sh

ENTRYPOINT [ "/test.sh" ]