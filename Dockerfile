FROM swift:3.1

RUN mkdir -p /usr/MtaProtoBuf
WORKDIR /usr/MtaProtoBuf/
COPY . /usr/MtaProtoBuf/

RUN swift build -c release

CMD ["/usr/MtaProtoBuf/.build/release/MtaProtoBuf", "mta key here"]