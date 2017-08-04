

import Foundation

extension Data {

    public func toJSON() -> AnyObject? {
        return ((try? JSONSerialization.jsonObject(with: self, options: .allowFragments)) ?? nil) as AnyObject?
    }

}

