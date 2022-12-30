FROM alpine

ENV BOT_TOKEN "5985895388:AAGXp51Go66ZHJggDSg31uwFvGsExNlAFGs"
ENV BOT_USERID "1157375333"

RUN apk --update add --no-cache --virtual .build-deps \
        python gcc musl-dev git make g++ nodejs; \
    git clone https://github.com/jmendeth/node-botgram.git; cd node-botgram \
    npm install --save request; npm install; cd examples/shell; npm install;
    # TODO: remove build deps but keep the runtime deps
    # apk del .build-deps

WORKDIR /node-botgram/examples/shell/
CMD npm start $BOT_TOKEN $BOT_USERID
