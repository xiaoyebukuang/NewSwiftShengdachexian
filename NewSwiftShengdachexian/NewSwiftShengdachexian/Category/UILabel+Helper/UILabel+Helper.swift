//
//  UILabel+Helper.swift
//  NewSwiftShengdachexian
//
//  Created by admin on 2026/11/25.
//

import Foundation
import UIKit

extension UILabel {
    convenience init(textColor: UIColor, font: UIFont) {
        self.init()
        self.textColor = textColor
        self.font = font
    }
    
    convenience init(text: String, textColor: UIColor, font: UIFont) {
        self.init()
        self.text = text
        self.textColor = textColor
        self.font = font
    }
    
    convenience init(textColor: UIColor, textAlignment: NSTextAlignment, font: UIFont) {
        self.init()
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.font = font
    }
    
    convenience init(text: String, textColor: UIColor, textAlignment: NSTextAlignment, font: UIFont) {
        self.init()
        self.text = text
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.font = font
    }
    
    
}
