//
//  AppDelegate.swift
//  TMXMLYFM
//
//  Created by Luther on 2020/5/10.
//  Copyright © 2020 mrstock. All rights reserved.
//

import UIKit
import ESTabBarController_swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tabbar = setupTabbar(delegate: self as? UITabBarControllerDelegate)
        self.window?.rootViewController = tabbar
        self.window?.makeKeyAndVisible()
        
        setStaticGuidePage()
        
        return true
    }
    
    func setStaticGuidePage() {
        let imageArr: [String] = ["lead01","lead02","lead03"]
        let guideView = TMGuidePage.init(imageNameArr: imageArr, isHiddenSkipBtn: false)
        self.window?.rootViewController?.view.addSubview(guideView)
    }
    
    func setupTabbar(delegate: UITabBarControllerDelegate?) -> ESTabBarController {
        let tabbarConteoller = ESTabBarController()
        tabbarConteoller.delegate = delegate
        tabbarConteoller.title = "Irregularity"
        tabbarConteoller.tabBar.shadowImage = UIImage.init(named: "transparent")
        tabbarConteoller.shouldHijackHandler = {
            tabbarConteoller, ViewController, index in
            if index == 2 {
                return true
            }
            return false
        }
        tabbarConteoller.didHijackHandler = {
            tabbarConteoller, ViewController, index in
            
        }
        
        let v1 = TMHomeViewController()
        let v2 = TMListenViewController()
        let v3 = TMPlayViewController()
        let v4 = TMFindViewController()
        let v5 = TMMineViewController()
        
        v1.tabBarItem = ESTabBarItem.init(TMIrregularityBaseContentView(), title: "首页", image: UIImage.init(named: "home"), selectedImage: UIImage.init(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(TMIrregularityBaseContentView(), title: "我听", image: UIImage.init(named: "favor"), selectedImage: UIImage.init(named: "favor_1"))
        v3.tabBarItem = ESTabBarItem.init(TMIrregularityContentView(), title: nil, image: UIImage.init(named: "tab_play"), selectedImage: UIImage.init(named: "tab_play"))
        v4.tabBarItem = ESTabBarItem.init(TMIrregularityBaseContentView(), title: "发现", image: UIImage.init(named: "find"), selectedImage: UIImage.init(named: "find_1"))
        v5.tabBarItem = ESTabBarItem.init(TMIrregularityBaseContentView(), title: "我的", image: UIImage.init(named: "me"), selectedImage: UIImage.init(named: "me_1"))
        
        let nav1 = TMNavigationController.init(rootViewController: v1)
        let nav2 = TMNavigationController.init(rootViewController: v2)
        let nav3 = TMNavigationController.init(rootViewController: v3)
        let nav4 = TMNavigationController.init(rootViewController: v4)
        let nav5 = TMNavigationController.init(rootViewController: v5)
        v1.title = "首页"
        v2.title = "我听"
        v3.title = "播放"
        v4.title = "发现"
        v5.title = "我的"
        
        tabbarConteoller.viewControllers = [nav1,nav2,nav3,nav4,nav5]
        
        return tabbarConteoller
    }
}

