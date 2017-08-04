

import Foundation
import UIKit

public enum GradientViewDirection {

    case horizontal
    case vertcial
    case custom(start: CGPoint, end: CGPoint)

    var directionPoints: (start: CGPoint, end: CGPoint) {
        switch self {
        case .horizontal:
            return (start: CGPoint(x: 0, y: 0.5), end: CGPoint(x: 1, y: 0.5))
        case .vertcial:
            return (start: CGPoint(x: 0.5, y: 0), end: CGPoint(x: 0.5, y: 1))
        case let .custom(start, end):
            return (start: start, end: end)
        }
    }

}

open class GradientView: UIView {

    open var colors: [UIColor]? {
        didSet {
            updateColors()
        }
    }

    open var direction = GradientViewDirection.vertcial {
        didSet {
            updateDirection()
        }
    }

    fileprivate let gradientLayer = CAGradientLayer()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    fileprivate func setup() {
        backgroundColor = .clear
        layer.addSublayer(gradientLayer)
        updateColors()
        updateDirection()
    }

    fileprivate func updateColors() {
        guard let colors = colors else { return }
        gradientLayer.colors = colors.map { $0.cgColor }
        let count = CGFloat(colors.count)
        let locations = colors.enumerated().map { CGFloat($0.0) }.reduce([]) { $0 + [$1 / (count - 1)] }
        gradientLayer.locations = locations as [NSNumber]
    }

    fileprivate func updateDirection() {
        let (startPoint, endPoint) = direction.directionPoints
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
    }

//    override open func layoutSublayersOfLayer(_ layer: CALayer) {
//        super.layoutSublayersOfLayer(layer)
//        gradientLayer.frame = layer.frame
//    }

}
