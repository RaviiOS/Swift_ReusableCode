

import Foundation

public extension Double {

    public func currencyString() -> String? {
        return Constants.Formatters.currencyFormatter.string(from: NSNumber(value: self as Double))
    }

}

public extension Int {

    public func currencyString() -> String? {
        return Constants.Formatters.currencyFormatter.string(from: NSNumber(value: self as Int))
    }

}
