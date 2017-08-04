
import Foundation
import UIKit
public extension UIViewController {

    /// shows an UIAlertController alert with error title and message
    public func showError(_ title: String, message: String? = nil) {
        if !Thread.current.isMainThread {
            DispatchQueue.main.async { [weak self] in
                self?.showError(title, message: message)
            }
            return
        }

        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        controller.view.tintColor = UIWindow.appearance().tintColor
        controller.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .cancel, handler: nil))
        present(controller, animated: true, completion: nil)
    }
    public func setTitleImageView(){

        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 160, height: 36))
        imageView.contentMode = .scaleAspectFit
        
        // 4
        let image = UIImage(named: "oman")
        imageView.image = image
        
        // 5
        navigationItem.titleView = imageView
    }
}
