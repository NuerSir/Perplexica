FROM node:alpine

ARG NEXT_PUBLIC_WS_URL
ARG NEXT_PUBLIC_API_URL
ENV NEXT_PUBLIC_WS_URL=${NEXT_PUBLIC_WS_URL}
ENV NEXT_PUBLIC_API_URL=${NEXT_PUBLIC_API_URL}

WORKDIR /home/perplexica

COPY ui /home/perplexica/

RUN yarn install
# RUN yarn build

# CMD ["yarn", "start"]

# 容器启动时编译, 此作法可解决`docker run`时静态化`NEXT_PUBLIC_API_URL`域名
CMD ["sh", "-c", "yarn build && yarn start"]
