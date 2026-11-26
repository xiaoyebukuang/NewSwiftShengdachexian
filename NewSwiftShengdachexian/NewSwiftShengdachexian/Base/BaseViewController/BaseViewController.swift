//
//  BaseViewController.swift
//  NewSwiftShengdachexian
//
//  Created by admin on 2026/11/25.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    
    // MARK: - 可配置属性
    
    /// 是否在 push 后移除当前控制器，由具体业务页面按需设置。
    lazy var removeWhenPush: Bool = false
    
    /// 是否禁用系统右滑返回
    lazy var interactivePopDisabled: Bool = false
    
    /// 是否是第一页面
    lazy var isFirstVC: Bool = false
    
    
    // MARK: - 导航栏属性
    
    /// 导航栏内容区域高度，不包含状态栏。
    private lazy var custom_nav_bar_height: CGFloat = XYNavBarHeight(for: self)
    
    /// 自定义导航栏总高度，包含状态栏和导航栏内容区域。
    private lazy var custom_nav_height: CGFloat = XYNavAndStatusBarHeight(for: self)
    
    /// 自定义导航栏容器，顶部预留状态栏区域。
    lazy var customNavBar: UIView = {
        let view = UIView()
        view.addSubview(baseNavBarView)
        baseNavBarView.snp.makeConstraints { make in
            // 内容区域固定在底部，上方空间留给状态栏。
            make.left.bottom.equalTo(view)
            make.width.equalTo(view)
            make.height.equalTo(custom_nav_bar_height)
        }
        return view
    }()
    
    /// 导航栏内容区域，承载标题和左右按钮。
    lazy var baseNavBarView: UIView = {
        let view = UIView()
        
        // 先添加右侧容器，使标题和左侧按钮位于其上层。
        view.addSubview(rightButtonView)
        rightButtonView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(view)
        }
        
        view.addSubview(base_leftBtn)
        base_leftBtn.snp.makeConstraints { make in
            make.centerY.equalTo(view)
            make.left.equalTo(view).offset(5)
            make.width.height.equalTo(44)
        }
        return view
    }()
    
    /// 导航栏中间标题。
    lazy var titleLabel: UILabel = {
        let label = UILabel.init(textColor: UIColor.color_1A1A1A(), font: kSystemBoldFont(16))
        return label
    }()
    
    /// 默认左侧按钮，点击后返回上一个页面。
    lazy var base_leftBtn: UIButton = {
        let button = UIButton.init(type: .custom)
        button.addTarget(self, action: #selector(leftNavigationBarEvent(_:)), for: .touchUpInside)
        return button
    }()
    
    /// 右侧按钮容器，子类可在此视图中添加自定义按钮。
    lazy var rightButtonView: UIView = {
        let view = UIView.init()
        return view
    }()
    
    
    // MARK: 内容
    /// 基础的内容view
    lazy var baseContentView: UIView = {
        let view = UIView.init()
        return view
    }()
    
    /// 内容背景
    lazy var navBGImageView: UIImageView = {
        let imageView = UIImageView.init(image: UIImage.init(named: "nav_bg"))
        return imageView
    }()
    
    
    // MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        self.base_leftBtn.isHidden = true
        setupUI()
    }

    // MARK: - UI 布局

    /// 添加基础导航栏。子类重写此方法时需要调用 super.setupUI()。
    func setupUI() {
        /// 背景
        let bgImage = UIImage.init(named: "nav_bg")
        let image_height = bgImage!.size.height
        let image_width = bgImage!.size.width
        self.view.addSubview(self.navBGImageView)
        self.navBGImageView.snp.makeConstraints { make in
            make.left.top.equalTo(self.view)
            make.width.equalTo(self.view)
            make.height.equalTo(MAIN_SCREEN_WIDTH*image_height/image_width)
        }
        
        /// 导航栏
        self.view.addSubview(self.customNavBar)
        self.customNavBar.snp.makeConstraints { make in
            make.left.top.right.equalTo(self.view)
            make.height.equalTo(self.custom_nav_height)
        }
        
        /// 内容
        self.view.addSubview(self.baseContentView)
        self.baseContentView.snp.makeConstraints { make in
            make.left.bottom.equalTo(self.view)
            make.width.equalTo(self.view)
            make.top.equalTo(self.customNavBar.snp.bottom)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // 视图加入 window 后重新获取真实高度，适配横竖屏和动态状态栏。
        let navigationBarHeight = XYNavBarHeight(for: self)
        let totalHeight = XYNavAndStatusBarHeight(for: self)

        if custom_nav_bar_height != navigationBarHeight {
            custom_nav_bar_height = navigationBarHeight
            baseNavBarView.snp.updateConstraints { make in
                make.height.equalTo(navigationBarHeight)
            }
        }

        if custom_nav_height != totalHeight {
            custom_nav_height = totalHeight
            customNavBar.snp.updateConstraints { make in
                make.height.equalTo(totalHeight)
            }
        }
    }

    // MARK: - 导航事件

    @objc private func leftNavigationBarEvent(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
