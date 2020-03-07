FROM node:10

RUN npm install wd

ENTRYPOINT [ "./test.sh" ]