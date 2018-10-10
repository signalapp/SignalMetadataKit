//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
//

import Foundation

extension Data {
    public var prependKeyType: Data {
        return (self as NSData).prependKeyType() as Data
    }

    public var removeKeyType: Data {
        return (self as NSData).removeKeyType() as Data
    }
}
