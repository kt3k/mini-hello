FROM alpine:3.9.2
RUN apk add --no-cache nasm
COPY h.s h.s
RUN nasm -f bin -oh h.s && chmod +x h
FROM scratch
COPY --from=0 h h
ENTRYPOINT ["/h"]
