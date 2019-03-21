# mini-hello

> Very small hello-world container

The result container size is 63 bytes.

The nasm source code is based on `hello.asm` at http://www.muppetlabs.com/~breadbox/software/tiny/useless.html

```console
$ docker build . -t hello
Sending build context to Docker daemon  44.54kB
Step 1/7 : FROM alpine:3.9.2
 ---> 5cb3aa00f899
Step 2/7 : RUN apk add --no-cache nasm
 ---> Using cache
 ---> 186e3b82213e
Step 3/7 : COPY h.s h.s
 ---> d4bf294f2bed
Step 4/7 : RUN nasm -f bin -oh h.s && chmod +x h
 ---> Running in a8cd23c64831
Removing intermediate container a8cd23c64831
 ---> c73fb2e79805
Step 5/7 : FROM scratch
 ---> 
Step 6/7 : COPY --from=0 h h
 ---> Using cache
 ---> 6713f21ca472
Step 7/7 : ENTRYPOINT ["/h"]
 ---> Using cache
 ---> f4e8d782ead8
Successfully built f4e8d782ead8
Successfully tagged hello:latest
$ docker run hello
Hello, world!
$ docker inspect hello | jq .[0].Size
63
```
