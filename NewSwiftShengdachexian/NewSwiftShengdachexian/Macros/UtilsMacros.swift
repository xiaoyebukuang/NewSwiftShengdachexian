//
//  UtilsMacros.swift
//  NewSwiftShengdachexian
//
//  Created by admin on 2026/11/25.
//

import Foundation
import UIKit

func kSystemBoldFont(_ size: CGFloat) -> UIFont {
    let font = UIFont.init(name: "PingFangSC-Semibold", size: size);
    return font ?? UIFont.boldSystemFont(ofSize: size)
}
func kSystemFont(_ size: CGFloat) -> UIFont {
    let font = UIFont.init(name: "PingFangSC-Regular", size: size);
    return font ?? UIFont.systemFont(ofSize: size)
}
