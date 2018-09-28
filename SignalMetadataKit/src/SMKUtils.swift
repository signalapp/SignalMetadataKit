//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
//

import Foundation
import SignalCoreKit

@objc public class SMKUtils: NSObject {

    @objc public static let kUDAccessKeyLength: Int = 16

    @objc public class func udAccessKeyForProfileKey(profileKey: Data) throws -> Data {
        guard let aesGcmKey = OWSAES256Key(dataIfValid: profileKey) else {
            throw SMKError.assertionError(description: "Profile key is not valid AES GCM key.")
        }

        // We derive the "ud access key" from the private key by encrypting zeroes.
        let emptyPlaintextLength = 16
        let emptyPlaintext = Data(count: Int(emptyPlaintextLength))
        let initializationVector = Data(count: Int(kAESGCM256_IVLength))
        guard let result = Cryptography.encryptAESGCM(plainTextData: emptyPlaintext,
                                                initializationVector: initializationVector,
                                                additionalAuthenticatedData: nil,
                                                key: aesGcmKey) else {
                                                    throw SMKError.assertionError(description: "Could not derive UD access key from profile key.")
        }
        guard result.ciphertext.count == SMKUtils.kUDAccessKeyLength else {
            throw SMKError.assertionError(description: "UD access key has invalid length.")
        }
        return result.ciphertext
    }
}
