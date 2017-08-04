
import Foundation
import UIKit
public protocol CustomViewAnimations {

    func shake(_ duration: CFTimeInterval)
    func spin(_ duration: CFTimeInterval, rotations: CGFloat, repeatCount: Float)

}

@IBDesignable class DesignableView: UIView {
    
    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow()
            }
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            
            // Don't touch the masksToBound property if a shadow is needed in addition to the cornerRadius
            if shadow == false {
                self.layer.masksToBounds = true
            }
        }
    }

    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
                   shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
                   shadowOpacity: Float = 0.4,
                   shadowRadius: CGFloat = 3.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    /// A property that accesses the backing layer's opacity.
    @IBInspectable
    open var opacity: Float {
        get {
            return layer.opacity
        }
        set(value) {
            layer.opacity = value
        }
    }
    
    /// A property that accesses the backing layer's shadow
    @IBInspectable
    open var shadowColor: UIColor? {
        get {
            guard let v = layer.shadowColor else {
                return nil
            }
            
            return UIColor(cgColor: v)
        }
        set(value) {
            layer.shadowColor = value?.cgColor
        }
    }
    
    /// A property that accesses the backing layer's shadowOffset.
    @IBInspectable
    open var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set(value) {
            layer.shadowOffset = value
        }
    }
    
    /// A property that accesses the backing layer's shadowOpacity.
    @IBInspectable
    open var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set(value) {
            layer.shadowOpacity = value
        }
    }
    
    /// A property that accesses the backing layer's shadowRadius.
    @IBInspectable
    open var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set(value) {
            layer.shadowRadius = value
        }
    }
    
    /// A property that accesses the backing layer's shadowPath.
    @IBInspectable
    open var shadowPath: CGPath? {
        get {
            return layer.shadowPath
        }
        set(value) {
            layer.shadowPath = value
        }
    }
 
    
    /// A property that accesses the layer.borderWith.
    @IBInspectable
    open var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set(value) {
            layer.borderWidth = value
        }
    }
    
    /// A property that accesses the layer.borderColor property.
    @IBInspectable
    open var borderColor: UIColor? {
        get {
            guard let v = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: v)
        }
        set(value) {
            layer.borderColor = value?.cgColor
        }
    }
}

extension UIView: CustomViewAnimations {

    
    
    public func shake(_ duration: CFTimeInterval = 0.3) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values =  [0, 20, -20, 10, 0]
        animation.keyTimes = [0, NSNumber(value: 1 / 6.0), NSNumber(value: 3 / 6.0), NSNumber(value: 5 / 6.0), 1]
        animation.duration = duration
        animation.isAdditive = true

        layer.add(animation, forKey:"shake")
    }

    public func spin(_ duration: CFTimeInterval, rotations: CGFloat, repeatCount: Float) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue = M_PI * 2.0 * Double(rotations)
        animation.duration = duration
        animation.isCumulative = true
        animation.repeatCount = repeatCount

        layer.add(animation, forKey:"rotationAnimation")
    }

}

public extension UIView {
    /**
     A function that returns a view containing the views passed as parameter as if it was a vertical stack view (putting all views vertically one after the other).
     Thought to be a iOS 8 alternative to real UIStackViews
     Note: Views to be stacked should define their height by constraints as their 'translatesAutoresizingMaskIntoConstraints' will be set to 'false'

     - parameter views:         The views that will conform the stackview
     - parameter alignLeading:  If the stacked views should be aligned on the leading side. Default is true
     - parameter alignTrailing: If the stacked views should be aligned on the trailing side. Default is true
     - parameter frame:         Frame for the stackView. If nil then the frame will be calculated with the passed views. Defauilt is nil
     - parameter width:         Width for the stackview. Used if frame is nil. Default is whole screen width

     - returns: A view with the stacked views.
     */
    static public func verticalStackView(_ views: [UIView], alignLeading: Bool = true, alignTrailing: Bool = true, frame: CGRect? = nil,
                                  width: CGFloat = UIScreen.main.bounds.width) -> UIView {
        guard !views.isEmpty else { return UIView(frame: frame ?? .zero) }
        let view = UIView(frame: frame ?? CGRect(x: 0, y: 0, width: width, height: views.reduce(0, { $0 + $1.frame.height })))

        // add views as subviews
        _ = views.map { view.addSubview($0); $0.translatesAutoresizingMaskIntoConstraints = false }

        // define options
        var options = NSLayoutFormatOptions()
        if alignLeading {
            options = options.union(NSLayoutFormatOptions.alignAllLeading)
        }
        if alignTrailing {
            options = options.union(NSLayoutFormatOptions.alignAllTrailing)
        }

        // create constraints
        var index = 0
        for _ in [1..<views.count] {
            let firstView = views[index]
            let secondView = views[index + 1]

            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[first]-0-[second]", options: options, metrics: nil, views: ["first": firstView, "second": secondView]))
            index += 1
        }

        // add constraints for first and last view
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[first]", options: options,
            metrics: nil, views: ["first": views.first!]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[last]-0-|", options: options,
            metrics: nil, views: ["last": views.last!]))

        // add width constraint
        view.addConstraint(NSLayoutConstraint(item: views.first!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: width))
        view.addConstraint(NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: views.first, attribute: .width, multiplier: 1, constant: 0))

        return view
    }

}
