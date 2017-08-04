

import Foundation
import UIKit
public extension UINavigationBar {

    public func setTransparent(_ transparent: Bool) {
        if transparent {
            setBackgroundImage(UIImage(), for: .default)
            shadowImage = UIImage()
            isTranslucent = true
            backgroundColor = .clear
        } else {
            // By default take values from UINavigationBar appearance
            let backImage = UINavigationBar.appearance().backgroundImage(for: .default)
            setBackgroundImage(backImage, for: .default)
            shadowImage = UINavigationBar.appearance().shadowImage
            isTranslucent = UINavigationBar.appearance().isTranslucent
            backgroundColor = UINavigationBar.appearance().backgroundColor
        }
    }
    
    }
