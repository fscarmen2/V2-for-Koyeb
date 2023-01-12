FROM nginx:latest
EXPOSE 80
WORKDIR /app
USER root

COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh ./

RUN apt-get update && apt-get install -y wget unzip iproute2 systemctl &&\
    wget -O temp.zip https://github.com/v2fly/v2ray-core/releases/download/v4.45.0/v2ray-linux-64.zip &&\
    unzip temp.zip v2ray v2ctl geoip.dat geosite.dat &&\
    mv v2ray v &&\
    rm -f temp.zip &&\
    chmod -v 755 v v2ctl entrypoint.sh &&\
    echo 'ewoJImxvZyI6IHsKCQkiYWNjZXNzIjogIi9kZXYvbnVsbCIsCgkJImVycm9yIjogIi9kZXYvbnVs\
bCIsCgkJImxvZ2xldmVsIjogIndhcm5pbmciCgl9LAoJImluYm91bmRzIjogW3sKCQkJInBvcnQi\
OiAxMDAwMCwKCQkJImxpc3RlbiI6ICIxMjcuMC4wLjEiLAoJCQkicHJvdG9jb2wiOiAidm1lc3Mi\
LAoJCQkic2V0dGluZ3MiOiB7CgkJCQkiY2xpZW50cyI6IFt7CgkJCQkJImlkIjogIlVVSUQiLAoJ\
CQkJCSJhbHRlcklkIjogMAoJCQkJfV0KCQkJfSwKCQkJInN0cmVhbVNldHRpbmdzIjogewoJCQkJ\
Im5ldHdvcmsiOiAid3MiLAoJCQkJIndzU2V0dGluZ3MiOiB7CgkJCQkJInBhdGgiOiAiVk1FU1Nf\
V1NQQVRIIgoJCQkJfQoJCQl9CgkJfSwKCQl7CgkJCSJwb3J0IjogMjAwMDAsCgkJCSJsaXN0ZW4i\
OiAiMTI3LjAuMC4xIiwKCQkJInByb3RvY29sIjogInZsZXNzIiwKCQkJInNldHRpbmdzIjogewoJ\
CQkJImNsaWVudHMiOiBbewoJCQkJCSJpZCI6ICJVVUlEIgoJCQkJfV0sCgkJCQkiZGVjcnlwdGlv\
biI6ICJub25lIgoJCQl9LAoJCQkic3RyZWFtU2V0dGluZ3MiOiB7CgkJCQkibmV0d29yayI6ICJ3\
cyIsCgkJCQkid3NTZXR0aW5ncyI6IHsKCQkJCQkicGF0aCI6ICJWTEVTU19XU1BBVEgiCgkJCQl9\
CgkJCX0KCQl9CgldLAoJIm91dGJvdW5kcyI6IFt7CgkJInByb3RvY29sIjogImZyZWVkb20iLAoJ\
CSJzZXR0aW5ncyI6IHt9Cgl9XSwKCSJkbnMiOiB7CgkJInNlcnZlciI6IFsKCQkJIjguOC44Ljgi\
LAoJCQkiOC44LjQuNCIsCgkJCSJsb2NhbGhvc3QiCgkJXQoJfQp9Cg==' > config

ENTRYPOINT [ "./entrypoint.sh" ]
