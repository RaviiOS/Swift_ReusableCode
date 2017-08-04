

import Foundation

/// Converts a JSON object to a printable String
public func JSONStringify(_ value: AnyObject, prettyPrinted: Bool = true) -> String {
    let options: JSONSerialization.WritingOptions = prettyPrinted ? .prettyPrinted : []
    if JSONSerialization.isValidJSONObject(value) {
        if let data = try? JSONSerialization.data(withJSONObject: value, options: options), let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
            return string as String
        }
    }
    return ""
}
