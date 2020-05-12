//
//  TMHomeViewController.swift
//  TMXMLYFM
//
//  Created by Luther on 2020/5/11.
//  Copyright © 2020 mrstock. All rights reserved.
//

import UIKit
import DNSPageView

class TMHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
        setupSubviews()
    }
    
    func setupSubviews() {
        
        let style = PageStyle()
        style.isTitleViewScrollEnabled = false
        style.isTitleScaleEnabled = true
        style.isShowBottomLine = true
        style.titleSelectedColor = UIColor.black
        style.titleColor = UIColor.gray
        style.bottomLineColor = DominantColor
        style.bottomLineHeight = 2
        style.bottomLineWidth = 30
        
        let titles = ["推荐","分类","VIP","直播","广播"]
        let childViewControllers = [TMHomeRecommendController(),TMHomeCategoryController(),TMHomeVIPController(),TMHomeLiveController(),TMHomeRadioController()]
        let pageView = PageView(frame: CGRect(x: 0, y: navigationBarHeight, width: kScreenWidth, height: kScreenHeight - navigationBarHeight), style: style, titles: titles, childViewControllers: childViewControllers)
        self.view.addSubview(pageView)
    }

}
