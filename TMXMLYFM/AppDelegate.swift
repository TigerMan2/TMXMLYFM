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
        
        setStaticGuidePage()
        
        return true
    }
    
    func setStaticGuidePage() {
        let imageArr: [String] = ["lead01","lead02","lead03"]
        let guideView = TMGuidePage.init(imageNameArr: imageArr, isHiddenSkipBtn: false)
        self.window?.rootViewController?.view.addSubview(guideView)
    }


}

