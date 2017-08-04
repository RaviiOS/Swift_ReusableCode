
import Foundation
import UIKit

public struct Appearances {

    public static func removeBackImageIndicatorFromNavigationBar() {
        // Example on how remove the back indicator image from back button
        UINavigationBar.appearance().backIndicatorImage = UIImage()
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage()

        // Example on how position text within backbutton, for example to remove the extra left padding from
        // button when tno back indicator image is used
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -20, vertical: 0), for: .default)
    }

}
