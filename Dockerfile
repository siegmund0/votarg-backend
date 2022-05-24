FROM node:14.17.6-buster-slim

ENV APP $APP
ENV APP_NAME $APP_NAME
ENV PORT $PORT
ENV DATABASE_HOST $DATABASE_HOST
ENV DATABASE_PORT $DATABASE_PORT
ENV DATABASE_USER $DATABASE_USER
ENV DATABASE_PASS $DATABASE_PASS
ENV DATABASE_NAME $DATABASE_NAME
ENV DATABASE_SYNC $DATABASE_SYNC
ENV DATABASE_TYPE $DATABASE_TYPE
ENV DATABASE_AUTO_LOAD_ENTITIES $DATABASE_AUTO_LOAD_ENTITIES
ENV DB_CONNECTION_TYPE $DB_CONNECTION_TYPE
ENV MINIO_ENDPOINT $MINIO_ENDPOINT
ENV MINIO_ACCESS_KEY $MINIO_ACCESS_KEY
ENV MINIO_SECRET_KEY $MINIO_SECRET_KEY
ENV MINIO_USE_SSL $MINIO_USE_SSL
ENV MINIO_BUCKET $MINIO_BUCKET

WORKDIR /app
COPY ./src /app/
COPY ./docker-entrypoint.sh /app/
COPY ./Dockerfile /app/
COPY ./nest-cli.json /app/
COPY ./ormconfig.js /app/
COPY ./tsconfig.json /app/
COPY ./tsconfig.build.json /app/
COPY ./package.json /app/
RUN chmod +x /app/docker-entrypoint.sh
ENTRYPOINT ["/app/docker-entrypoint.sh"]