# _pihole-alpine_

# Build
~~~sh
docker build -t vlburtsev/pihole-alpine:3.16 .
~~~
# OR
~~~sh
docker pull vlburtsev/pihole-alpine:3.16
~~~
# RUN
~~~sh
docker run -it \
        --rm \
        -p 5053:53 \
        -p 5053:53/udp \
        vlburtsev/pihole-alpine:3.16
~~~
# Info
~~~sh
docker-compose exec pihole sh -c "echo '>stats' | nc 127.0.0.1 4711"
~~~
~~~sh
docker-compose exec pihole sh -c "echo '>getallqueries (50)' | nc 127.0.0.1 4711"
~~~
~~~sh
docker-compose exec pihole sh -c "echo '>top-domains (50)' | nc 127.0.0.1 4711"
~~~

Notes: [more commands](https://docs.pi-hole.net/ftldns/telnet-api/)
