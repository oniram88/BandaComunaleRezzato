# Our Docker image will be based on ruby:2-slim
# it is a very light docker image.
FROM jekyll/builder:4.2.0

RUN apk update && apk add --no-cache  \
    imagemagick-dev \
    imagemagick

# This is our entrypoint to our custom scripts
# more about that in a sec
COPY entrypoint.sh /
RUN mkdir -p /site_builder
WORKDIR /site_builder
# Use the entrypoint.sh file as the container entrypoint
# when Github executes our Docker container
ENTRYPOINT ["sh", "/entrypoint.sh"]