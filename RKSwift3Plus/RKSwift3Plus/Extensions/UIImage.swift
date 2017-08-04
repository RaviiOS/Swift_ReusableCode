

import UIKit

public extension UIImage {

    fileprivate static var saveToCameraRollCompletions: [UIImage: ((Bool) -> Void)] = [:]

    public convenience init(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()

        context?.setFillColor(color.cgColor)
        context?.fill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        self.init(cgImage: (image?.cgImage!)!)
        UIGraphicsEndImageContext()
    }

    public convenience init(view: UIView) {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        self.init(cgImage: (image?.cgImage!)!)
        UIGraphicsEndImageContext()
    }

    public convenience init(image: UIImage, scaledToSize: CGSize) {
        UIGraphicsBeginImageContextWithOptions(scaledToSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: scaledToSize.width, height: scaledToSize.height))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        self.init(cgImage: (scaledImage?.cgImage!)!)
        UIGraphicsEndImageContext()
    }

    public class func imageWithColor(_ color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIImage(color: color, size: size)
    }

    public class func imageWithView(_ view: UIView) -> UIImage {
        return UIImage(view: view)
    }

    public class func imageWithImage(_ image: UIImage, scaledToSize size: CGSize) -> UIImage {
        return UIImage(image: image, scaledToSize: size)
    }

    public func imageScaledToSize(_ size: CGSize) -> UIImage {
        return UIImage.imageWithImage(self, scaledToSize: size)
    }

    public func saveToCameraRoll(_ completion: ((_ succeded: Bool) -> Void)? = nil) {
        if let completion = completion {
            UIImage.saveToCameraRollCompletions[self] = completion
        }
        UIImageWriteToSavedPhotosAlbum(self, self, #selector(UIImage.image(_:didFinishSavingWithError:contextInfo:)), nil)
    }

    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        UIImage.saveToCameraRollCompletions[image]?(error == nil)
        UIImage.saveToCameraRollCompletions[image] = nil
    }

}
