How to Run
----------

1. Add your MTA key to the Dockerfile
2. `docker build -t mtaprotobuf .`
3. `docker run --rm mtaprotobuf`


Problems
--------

1. Although debug mode compiles and runs fine, when I build for release in the Dockerfile `swift build -c release`, I get an error. Here is the error:

```
    Compile Swift Module 'ProtocolBuffers' (23 sources)
    swift: /home/buildnode/disk2/workspace/oss-swift-3.1-package-linux-ubuntu-16_04/swift/lib/SILOptimizer/SILCombiner/SILCombine.cpp:292: swift::SILInstruction *swift::SILCombiner::eraseInstFromFunction(swift::SILInstruction &, SILBasicBlock::iterator &, bool): Assertion `onlyHaveDebugUses(&I) && "Cannot erase instruction that is used!"' failed.
    0  swift           0x000000000362f718
    1  swift           0x000000000362fe56
    2  libpthread.so.0 0x00007f47a782b390
    3  libc.so.6       0x00007f47a6191428 gsignal + 56
    4  libc.so.6       0x00007f47a619302a abort + 362
    5  libc.so.6       0x00007f47a6189bd7
    6  libc.so.6       0x00007f47a6189c82
    7  swift           0x0000000000da7c28
    8  swift           0x0000000000db6d1a
    9  swift           0x0000000000da83f4
    10 swift           0x0000000000da9702
    11 swift           0x0000000000bdff5d
    12 swift           0x0000000000be0aa9
    13 swift           0x0000000000be1f1f
    14 swift           0x0000000000491ae8
    15 swift           0x0000000000bea71b
    16 swift           0x000000000047f52d
    17 swift           0x000000000043b277
    18 libc.so.6       0x00007f47a617c830 __libc_start_main + 240
    19 swift           0x00000000004386b9
    Stack dump:
    0.	Program arguments: /usr/bin/swift -frontend -c /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/Google.Protobuf.Duration.proto.swift /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/ConcreateExtensionField.swift /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/Google.Protobuf.SwiftDescriptor.proto.swift /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/WireFormat.swift /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/Google.Protobuf.Wrappers.proto.swift /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/CodedOutputStream.swift /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/Google.Protobuf.Api.proto.swift /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/AbstractMessage.swift /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/CodedInputStream.swift /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/Google.Protobuf.Descriptor.proto.swift /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/RingBuffer.swift /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/Google.Protobuf.Type.proto.swift /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/Google.Protobuf.Timestamp.proto.swift /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/GeneratedMessage.swift /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/Google.Protobuf.Empty.proto.swift /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/Google.Protobuf.Any.proto.swift /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/Google.Protobuf.Struct.proto.swift /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/UnknownFieldSet.swift /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/Google.Protobuf.SourceContext.proto.swift /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/ExtensionRegistry.swift /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/ExtendableMessage.swift /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/Google.Protobuf.FieldMask.proto.swift /usr/MtaProtoBuf/.build/checkouts/protobuf-swift.git--9195301851829669348/Source/Field.swift -target x86_64-unknown-linux-gnu -disable-objc-interop -I /usr/MtaProtoBuf/.build/release -module-cache-path /usr/MtaProtoBuf/.build/release/ModuleCache -D SWIFT_PACKAGE -emit-module-doc-path /usr/MtaProtoBuf/.build/release/ProtocolBuffers.swiftdoc -O -parse-as-library -module-name ProtocolBuffers -emit-module-path /usr/MtaProtoBuf/.build/release/ProtocolBuffers.swiftmodule -emit-dependencies-path /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/ProtocolBuffers.d -num-threads 8 -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/Google.Protobuf.Duration.proto.swift.o -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/ConcreateExtensionField.swift.o -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/Google.Protobuf.SwiftDescriptor.proto.swift.o -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/WireFormat.swift.o -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/Google.Protobuf.Wrappers.proto.swift.o -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/CodedOutputStream.swift.o -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/Google.Protobuf.Api.proto.swift.o -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/AbstractMessage.swift.o -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/CodedInputStream.swift.o -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/Google.Protobuf.Descriptor.proto.swift.o -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/RingBuffer.swift.o -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/Google.Protobuf.Type.proto.swift.o -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/Google.Protobuf.Timestamp.proto.swift.o -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/GeneratedMessage.swift.o -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/Google.Protobuf.Empty.proto.swift.o -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/Google.Protobuf.Any.proto.swift.o -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/Google.Protobuf.Struct.proto.swift.o -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/UnknownFieldSet.swift.o -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/Google.Protobuf.SourceContext.proto.swift.o -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/ExtensionRegistry.swift.o -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/ExtendableMessage.swift.o -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/Google.Protobuf.FieldMask.proto.swift.o -o /usr/MtaProtoBuf/.build/release/ProtocolBuffers.build/Field.swift.o 
    1.	While running pass #1017604 SILFunctionTransform "SIL Combine" on SILFunction "@_TTWC15ProtocolBuffers30AbstractProtocolBuffersMessageS_22ProtocolBuffersMessageS_FS1_6toJSONfzT_V10Foundation4Data".
    <unknown>:0: error: unable to execute command: Aborted
    <unknown>:0: error: compile command failed due to signal (use -v to see invocation)
    <unknown>:0: error: build had 1 command failures
    swift-build: error: exit(1): /usr/bin/swift-build-tool -f /usr/MtaProtoBuf/.build/release.yaml
    The command '/bin/sh -c swift build -c release' returned a non-zero code: 1
```    

Any ideas on how to fix?

