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
# docker-compose exec pihole sh -c "echo '>stats' | nc 127.0.0.1 4711"
domains_being_blocked 136942
dns_queries_today 5782
ads_blocked_today 30
ads_percentage_today 0.518852
unique_domains 695
queries_forwarded 3816
queries_cached 1813
clients_ever_seen 24
unique_clients 23
dns_queries_all_types 5782
reply_UNKNOWN 279
reply_NODATA 1467
reply_NXDOMAIN 310
reply_CNAME 1068
reply_IP 2191
reply_DOMAIN 82
reply_RRNAME 7
reply_SERVFAIL 0
reply_REFUSED 0
reply_NOTIMP 0
reply_OTHER 0
reply_DNSSEC 316
reply_NONE 0
reply_BLOB 62
dns_queries_all_replies 5782
privacy_level 0
status enabled
---EOM---

~~~

Notes: [more commands](https://docs.pi-hole.net/ftldns/telnet-api/)