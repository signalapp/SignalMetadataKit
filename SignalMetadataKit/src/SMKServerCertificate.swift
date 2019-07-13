//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
//

import Foundation

// See:
// https://github.com/signalapp/libsignal-metadata-java/blob/cac0dde9de416a192e64a8940503982820870090/java/src/main/java/org/signal/libsignal/metadata/certificate/ServerCertificate.java
@objc public class SMKServerCertificate: NSObject {

    @objc public let keyId: UInt32
    @objc public let key: ECPublicKey
    @objc public let serializedData: Data
    @objc public let certificateData: Data
    @objc public let signatureData: Data

    // public ServerCertificate(byte[] serialized) throws InvalidCertificateException {
    public init(serializedData: Data) throws {
        // SignalProtos.ServerCertificate wrapper = SignalProtos.ServerCertificate.parseFrom(serialized);
        // if (!wrapper.hasCertificate() || !wrapper.hasSignature()) {
        //   throw new InvalidCertificateException("Missing fields");
        // }
        let wrapperProto = try SMKProtoServerCertificate.parseData(serializedData)

        // SignalProtos.ServerCertificate.Certificate certificate = // SignalProtos.ServerCertificate.Certificate.parseFrom(wrapper.getCertificate());
        //
        // if (!certificate.hasId() || !certificate.hasKey()) {
        //   throw new InvalidCertificateException("Missing fields");
        // }
        let certificateProto = try SMKProtoServerCertificateCertificate.parseData(wrapperProto.certificate)

        // this.keyId       = certificate.getId();
        self.keyId = certificateProto.id

        // this.key         = Curve.decodePoint(certificate.getKey().toByteArray(), 0);
        self.key = try ECPublicKey(serializedKeyData: certificateProto.key)

        // this.serialized  = serialized;
        self.serializedData = serializedData

        // this.certificate = wrapper.getCertificate().toByteArray();
        // this.signature   = wrapper.getSignature().toByteArray();
        self.certificateData = wrapperProto.certificate
        self.signatureData = wrapperProto.signature
    }
}
