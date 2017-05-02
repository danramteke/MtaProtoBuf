Setup
-----

1. install google protobuf compiler https://github.com/google/protobuf or `brew install protobuf`
2. `protoc --swift_out=./Sources/ --plugin=../swift-protobuf/.build/debug/protoc-gen-swift gtfs-realtime.proto`


How to Run
----------

1. Add your MTA key to the Dockerfile
2. `docker build -t mtaprotobuf .`
3. `docker run --rm mtaprotobuf`




