//
//  DimensMacros.swift
//  NewSwiftShengdachexian
//
//  Created by admin on 2026/11/25.
//

import Foundation
import UIKit


let MAIN_SCREEN_BOUNDS = UIScreen.main.bounds
let MAIN_SCREEN_WIDTH = MAIN_SCREEN_BOUNDS.size.width
let MAIN_SCREEN_HEIGHT = MAIN_SCREEN_BOUNDS.size.height



// MARK: 获取导航bar的高度
func XYNavBarHeight(for vc: UIViewController? = nil) -> CGFloat {
    guard let nav = vc?.navigationController else { return 44 }
    return nav.navigationBar.frame.size.height
}

// MARK: 获取状态栏高度（兼容iOS26动态高度）
func XYStatusBarHeight(for vc: UIViewController? = nil) -> CGFloat {
    guard let window = vc?.view.window else { return 20.0}
    
    let statusBarHeight = window.windowScene?
        .statusBarManager?
        .statusBarFrame.height ?? window.safeAreaInsets.top
    guard statusBarHeight > 0 else {
        return 20.0
    }
    return statusBarHeight
}

func XYNavAndStatusBarHeight(for vc: UIViewController? = nil) -> CGFloat{
    let window = vc?.view?.window
    print("求window \(String(describing: window))")
    guard let window else { return XYStatusBarHeight() + XYNavBarHeight()}
    
    // 当前状态栏高度
    let statusBarHeight = XYStatusBarHeight(for: vc)

    // 当前导航栏真实高度，包含大标题等状态的变化
    let navigationBarHeight = XYNavBarHeight(for: vc)

    // 顶部总高度
    let totalHeight = statusBarHeight + navigationBarHeight

    print("状态栏：\(statusBarHeight)")
    print("导航栏：\(navigationBarHeight)")
    print("总高度：\(totalHeight)")
    
    return totalHeight
}
