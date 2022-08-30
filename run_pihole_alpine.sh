docker build -t vlburtsev/pihole-alpine:3.16 .

docker run -it \
        --rm \
        -p 5053:53 \
        -p 5053:53/udp \
        vlburtsev/pihole-alpine:3.16