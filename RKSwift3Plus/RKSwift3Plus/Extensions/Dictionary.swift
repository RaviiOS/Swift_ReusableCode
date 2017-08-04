

import Foundation

public extension Dictionary {
    mutating func merge(_ dict: [Key: Value]) {
        for (k, v) in dict {
            self.updateValue(v, forKey: k)
        }
    }
}
