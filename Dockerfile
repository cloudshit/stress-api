FROM public.ecr.aws/docker/library/alpine:3.20

RUN apk add --no-cache curl ngrep

ARG user=1000
ARG group=1000

USER $user:$group
WORKDIR /app

COPY --chown=$user:$group stress-arm64 .

RUN chmod +x stress-arm64

ENTRYPOINT ["/app/stress-arm64"]

