//
//  UIColor+Helper.swift
//  NewSwiftShengdachexian
//
//  Created by admin on 2026/11/25.
//

import Foundation
import UIKit

extension UIColor {
    class func color_hex(hex: String) -> UIColor {
        return UIColor.init(hex: hex)
    }
    class func color_hex(hex: String, alpha: CGFloat) -> UIColor {
        return UIColor.init(hex: hex, alpha: alpha)
    }
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        guard cString.count >= 6 else {
            self.init(white: 0, alpha: 0)   // 相当于 clearColor
            return
        }
        // 判断前缀
        if cString.hasPrefix("0X") {
            cString = String(cString.dropFirst(2))
        }
        if cString.hasPrefix("#") {
            cString = String(cString.dropFirst())
        }

        // 长度校验 + 一次性解析整个十六进制字符串
        guard cString.count == 6, let rgb = UInt32(cString, radix: 16) else {
            self.init(white: 0, alpha: 0)
            return
        }
        // 位运算提取 R、G、B
        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgb & 0x0000FF) / 255.0
    
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
    
    class func color_1A1A1A() -> UIColor {
        return UIColor.init(hex: "0x1A1A1A")
    }
    class func color_1A1A1A_05() -> UIColor {
        return UIColor.init(hex: "0x1A1A1A", alpha: 0.05)
    }
    class func color_1A1A1A_10() -> UIColor {
        return UIColor.init(hex: "0x1A1A1A", alpha: 0.10)
    }
    class func color_1A1A1A_25() -> UIColor {
        return UIColor.init(hex: "0x1A1A1A", alpha: 0.25)
    }
    class func color_1A1A1A_45() -> UIColor {
        return UIColor.init(hex: "0x1A1A1A", alpha: 0.45)
    }
    class func color_1A1A1A_65() -> UIColor {
        return UIColor.init(hex: "0x1A1A1A", alpha: 0.65)
    }
    
    
    class func color_FFFFFF() -> UIColor {
        return UIColor.init(hex: "0xFFFFFF", alpha: 0.65)
    }
    
    
}



