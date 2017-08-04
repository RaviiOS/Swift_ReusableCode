

import UIKit

public extension UIApplication {

    public class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }

        if let tab = base as? UITabBarController {
            let moreNavigationController = tab.moreNavigationController

            if let top = moreNavigationController.topViewController, top.view.window != nil {
                return topViewController(top)
            } else if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }

        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }

        return base
    }

    static public func changeRootViewController(_ rootViewController: UIViewController, animated: Bool = true, from: UIViewController? = nil, completion: ((Bool) -> Void)? = nil) {
        let window = UIApplication.shared.keyWindow ?? UIApplication.shared.delegate?.window ?? nil
        if let window = window, animated {
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
                let oldState: Bool = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                window.rootViewController = rootViewController
                window.makeKeyAndVisible()
                UIView.setAnimationsEnabled(oldState)
                }, completion: completion)
        } else {
            window?.rootViewController = rootViewController
        }
    }

    /**
     Change rootViewController of main window after dismissing current controller ( if current controller was presented). This avoids keeping unused view controllers in hidden windows

     - parameter from:       UIViewController from which to start the switch
     - parameter to:         UIViewController to be set as new rootViewController
     - parameter completion: Handler to be executed when controller switch finishes
     */
    static public func changeRootViewControllerAfterDismiss(_ from: UIViewController? = nil, to: UIViewController, completion: ((Bool) -> Void)? = nil) {
        if let presenting = from?.presentingViewController {
            presenting.view.alpha = 0
            from?.dismiss(animated: false, completion: {
                changeRootViewController(to, completion: completion)
            })
        } else {
            changeRootViewController(to, completion: completion)
        }
    }

    public static func makePhoneCall(_ phoneNumber: String) -> Bool {
        guard let phoneNumberUrl = URL(string: phoneNumber), UIApplication.shared.canOpenURL(phoneNumberUrl) else {
            return false
        }
        return UIApplication.shared.openURL(phoneNumberUrl)
    }

    public static var bundleIdentifier: String {
        return Bundle.main.bundleIdentifier!
    }

    // swiftlint:disable force_cast
    public static var buildVersion: String {
        return Bundle.main.infoDictionary!["CFBundleVersion"] as! String
    }

    public static var appVersion: String {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }

    public static var bundleName: String {
        return Bundle.main.infoDictionary!["CFBundleName"] as! String
    }
    // swiftlint:enable force_cast

}
