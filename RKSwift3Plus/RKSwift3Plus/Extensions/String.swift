
import Foundation
import UIKit
public extension String {

    /// Returns if a string is valid as email
    func isValidAsEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }

    /// Returns if a string is valid as phone number
    func isValidAsPhone() -> Bool {
        let phoneRegEx = "^[0-9-+]{9,15}$"
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: self)
    }

    /// Returns if a string is composed just of numbers or '-' symbol
    func isNumberString() -> Bool {
        let charSet = NSMutableCharacterSet(charactersIn: "-")
        charSet.formUnion(with: CharacterSet.decimalDigits)
        return  rangeOfCharacter(from: charSet.inverted) == nil
    }

    /// Returns the first number in a String if found
    func findFirstNumberInString() -> String? {
        if let range = rangeOfCharacter(from: CharacterSet.decimalDigits), let numRange = rangeOfCharacter(from: CharacterSet.decimalDigits.inverted, options: .literal,
                range: range.lowerBound..<self.endIndex) {
                return substring(with: range.lowerBound..<numRange.lowerBound)
        }
        return nil
    }

    /// Return the height necessary for a text given a width and font size. Same as `heightForString` extension on UIFont
    func renderedHeightWithFont(_ font: UIFont, width: CGFloat) -> CGFloat {
        let size = CGSize(width: width, height: 5000)
        let attributes = [NSFontAttributeName: font]
        let objcStr = NSString(string: self)
        let boundingRect = objcStr.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return boundingRect.height
    }

    /// Parses a first and a last name from a String. Takes last whitespace as separator for these values.
    func getFirstAndLastName() -> (String, String)? {
        guard let range = trimmingCharacters(in: CharacterSet.whitespaces).range(of: " ", options: .backwards,
            range: nil, locale: nil) else {
            return nil
        }
        let first = substring(to: range.lowerBound)
        let last = substring(from: range.upperBound)
        return (first, last)
    }
    
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString)
    }

}
