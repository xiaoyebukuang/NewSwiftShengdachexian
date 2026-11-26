//
//  CustomTabBarController.swift
//  NewSwiftShengdachexian
//
//  Created by admin on 2026/11/25.
//

import UIKit

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = false
        self.tabBar.layer.backgroundColor = UIColor.color_FFFFFF().cgColor
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        let titles = ["保险", "订单", "我的"]
        var controllerNames: [String]
        controllerNames = ["HomeViewController", "OrderListViewController", "MineViewController"]
        
        let normalImageArray = ["tab_normal_01", "tab_normal_02", "tab_normal_04"]
        let selectImageArray = ["tab_select_01", "tab_select_02", "tab_select_04"]
        
        let number = controllerNames.count
        
        
        var tempVCArrays: [CustomNavigationController] = []
        for i in 0..<number {
            
            var viewController: BaseViewController
            if let controllerClass = NSClassFromString(controllerNames[i]) as? BaseViewController.Type {
                viewController = controllerClass.init()
            } else {
                viewController = BaseViewController.init()
            }
            
            let normalImage = UIImage.init(named: normalImageArray[i])
            let selectImage = UIImage.init(named: selectImageArray[i])
            viewController.tabBarItem = UITabBarItem.init(title: titles[i], image: normalImage, selectedImage: selectImage)
            viewController.tabBarItem.setTitleTextAttributes([.foregroundColor : UIColor.color_hex(hex: "#64696B")], for: .normal)
            viewController.tabBarItem.setTitleTextAttributes([.foregroundColor : UIColor.color_hex(hex: "#2969D1")], for: .selected)
            
            let nav = CustomNavigationController.init(rootViewController: viewController)
            tempVCArrays.append(nav)
        }
        self.viewControllers = tempVCArrays
    }
    

}
