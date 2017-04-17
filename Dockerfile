FROM swift:3.1

RUN mkdir -p /usr/MtaProtoBuf
WORKDIR /usr/MtaProtoBuf/
COPY . /usr/MtaProtoBuf/

RUN swift build 

CMD ["/usr/MtaProtoBuf/.build/debug/MtaProtoBuf", "KEY_HERE"]