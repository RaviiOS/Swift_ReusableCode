

import UIKit

public extension UIFont {

    public func heightForString(_ string: NSString, width: CGFloat) -> CGFloat {
        let size = CGSize(width: width, height: 5000)
        let boundingRect = string.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: self], context: nil)
        return boundingRect.height
    }

}
