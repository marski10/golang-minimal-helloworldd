
# imagem menor e com menos vulnerabilidades 
FROM golang:alpine3.19 as compilador

#cria volume
COPY ./src/hello-world.go /tmp/

# seta area de trabalho
WORKDIR /tmp

RUN go build hello-world.go && rm hello-world.go

FROM scratch 

WORKDIR /tmp

COPY --from=compilador /tmp /tmp

ENTRYPOINT [ "./hello-world" ]