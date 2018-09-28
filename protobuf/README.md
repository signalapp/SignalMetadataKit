# SignalServiceKit Protobufs

These protobuf definitions are copied from libsignal-metadata-java, but modified
to match some iOS conventions.

## Prequisites

Install Apple's `swift-protobuf` (*not* the similarly named `protobuf-swift`)

    brew install swift-protobuf

This should install an up to date protobuf package as a dependency. Note that
since we use the legacy proto2 format, we need to specify this in our .proto
files.

    syntax = "proto2";

## Building Protobuf

    // Make sure that Signal-iOS is checked out alongside this repo, at the path: [repo root]/../Signal-iOS
    cd [repo root]/protobuf
    make

