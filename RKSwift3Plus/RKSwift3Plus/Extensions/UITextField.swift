//
//  UITextField.swift
//  FieldInspection
//
//  Created by Ravi on 25/07/17.
//  Copyright © 2017 MRMWR. All rights reserved.
//

import Foundation
import UIKit
public extension UITextField
{
    
    func useUnderline() {
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(origin: CGPoint(x: 0,y :self.frame.size.height - borderWidth), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
