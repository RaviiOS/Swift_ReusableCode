

import Foundation

// In order to use this helpers, you need to extend
// the String type and conform to ParametrizedString

public protocol ParametrizedString {

    var parameterFormat: String { get } /* for instance "{i}" */

}

extension ParametrizedString where Self: StringProtocol {

    public func parametrize(_ parameters: CustomStringConvertible...) -> String {
        return parameters
            .enumerated()
            .reduce(self.value) { replaceParameter(from: $0, index: $1.0, with: $1.1) }
    }

    public func parametrize(withDictonary dictonary: [Int: CustomStringConvertible]) -> String {
        return dictonary
            .reduce(self.value) { replaceParameter(from: $0, index: $1.0, with: $1.1) }
    }

    fileprivate func replaceParameter(from string: String, index: Int, with stringConvertible: CustomStringConvertible) -> String {
        let metaParameter = parameterFormat.replacingOccurrences(of: "i", with: "\(index)")
        return string.replacingOccurrences(of: metaParameter, with: stringConvertible.description)
    }

}

public protocol StringProtocol {

    var value: String { get }

}

extension String: StringProtocol {

    public var value: String { return self }

}

extension String {

    public var description: String { return self }

}
