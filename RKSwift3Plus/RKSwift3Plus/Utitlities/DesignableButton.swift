//
//  DesignableButton.swift
//  Citizen Services
//
//  Created by Ravi on 11/07/17.
//  Copyright © 2017 MRMWR. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class DesignableButton: UIButton {
    
//    @IBInspectable var cornerRadius: CGFloat = 0 {
//        didSet {
////            layer.cornerRadius = cornerRadius
//            layer.masksToBounds = cornerRadius > 0
//        }
//    }
//    @IBInspectable var borderWidth: CGFloat = 0 {
//        didSet {
//            layer.borderWidth = borderWidth
//        }
//    }
    @IBInspectable var borderColor: UIColor? = UIColor.clear {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    // IBInspectable properties for the gradient colors
//    @IBInspectable var bottomColor: UIColor = UIColor(red:0.98, green:0.49, blue:0.2, alpha:1)
//    @IBInspectable var middleColor: UIColor = UIColor(red:0.98, green:0.85, blue:0.38, alpha:1)
//    @IBInspectable var topColor: UIColor = UIColor(red:0.98, green:0.49, blue:0.2, alpha:1)
//    @IBInspectable var bottomColorAlpha: CGFloat = 1.0
//    @IBInspectable var middleColorAlpha: CGFloat = 1.0
//    @IBInspectable var topColorAlpha: CGFloat = 1.0
    
    // IBInspectable properties for rounded corners and border color / width
    @IBInspectable var cornerSize: CGFloat = 0
    @IBInspectable var borderSize: CGFloat = 0
    @IBInspectable var borderAlpha: CGFloat = 1.0
    
    override func draw(_ rect: CGRect) {
        
        // set up border and cornerRadius
        self.layer.cornerRadius = cornerSize
        self.layer.borderColor = borderColor?.withAlphaComponent(borderAlpha).cgColor
        self.layer.borderWidth = borderSize
        self.layer.masksToBounds = true
        
        // set up gradient
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = rect
//        let c1 = bottomColor.withAlphaComponent(bottomColorAlpha).cgColor
//        let c2 = middleColor.withAlphaComponent(middleColorAlpha).cgColor
//        let c3 = topColor.withAlphaComponent(topColorAlpha).cgColor
//        gradientLayer.colors = [c3, c2, c1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        self.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
}
