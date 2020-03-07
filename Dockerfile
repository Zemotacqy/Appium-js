FROM alpine:3.10

RUN npm install wd

ENTRYPOINT [ "./test.sh" ]