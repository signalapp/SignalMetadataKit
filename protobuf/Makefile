# See README.md in this dir for prerequisite setup.

PROTOC=protoc \
		--proto_path='./'
WRAPPER_SCRIPT=../../Signal-iOS/Scripts/ProtoWrappers.py \
		--proto-dir='./' --verbose

all: unidentified_delivery_protos

unidentified_delivery_protos: OWSUnidentifiedDelivery.proto
	$(PROTOC) --swift_out=../SignalMetadataKit/src/Generated \
		OWSUnidentifiedDelivery.proto
	$(WRAPPER_SCRIPT) --dst-dir=../SignalMetadataKit/src/Generated \
		--wrapper-prefix=SMKProto --proto-prefix=SMKProtos --proto-file=OWSUnidentifiedDelivery.proto
