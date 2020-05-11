//
//  TMGuidePage.swift
//  TMXMLYFM
//
//  Created by Luther on 2020/5/10.
//  Copyright © 2020 mrstock. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class TMGuidePage: UIView {
    
    var imageArr: [String]?
    var guidePageView: UIScrollView!
    var guidePageControl: UIPageControl?
    var playerController: AVPlayerViewController?
    
    init(imageNameArr: [String], isHiddenSkipBtn: Bool) {
        let frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
        super.init(frame: frame)
        self.imageArr = imageNameArr
        if self.imageArr == nil || self.imageArr?.count == 0 {
            return
        }
        addScrollView(frame: frame)
        addSkipBtn(isHiddenSkip: isHiddenSkipBtn)
        addImages()
        addPageControl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        print("deinit")
    }
}

extension TMGuidePage {
    
    func addScrollView(frame: CGRect) {
        self.guidePageView = UIScrollView.init(frame: frame)
        guidePageView.delegate = self
        guidePageView.backgroundColor = UIColor.lightGray
        guidePageView.bounces = false
        guidePageView.isPagingEnabled = true
        guidePageView.showsVerticalScrollIndicator = false
        guidePageView.showsHorizontalScrollIndicator = false
        guidePageView.contentSize = CGSize.init(width: kScreenWidth * (CGFloat)((self.imageArr?.count)!), height: kScreenHeight)
        addSubview(guidePageView)
    }
    // 跳过按钮
    func addSkipBtn(isHiddenSkip: Bool) {
        if isHiddenSkip {
            return;
        }
        let skipButton = UIButton.init(frame: CGRect(x: kScreenWidth * 0.8, y: kScreenWidth * 0.1, width: 70, height: 35))
        skipButton.setTitle("跳过", for: .normal)
        skipButton.setTitleColor(UIColor.white, for: .normal)
        skipButton.layer.cornerRadius = skipButton.bounds.size.height * 0.5
        skipButton.backgroundColor = UIColor.gray
        skipButton.addTarget(self, action: #selector(skipButtonClick), for: .touchUpInside)
        self.addSubview(skipButton)
    }
    
    // 跳过按钮点击
    @objc func skipButtonClick() {
        UIView.animate(withDuration: 1, animations: {
            self.alpha = 0
        }) { (finish) in
            self.removeFromSuperview()
        }
    }
    
    // 图片
    func addImages() {
        guard let imageArr = self.imageArr else {
            return;
        }
        for i in 0..<imageArr.count {
            let imageView = UIImageView.init(frame: CGRect(x: kScreenWidth * CGFloat(i), y: 0, width: kScreenWidth, height: kScreenHeight))
            let idString = (imageArr[i] as NSString).substring(from: imageArr[i].count - 3)
            if idString == "gif" {
                imageView.image = UIImage.gifImageWithName(imageArr[i])
            } else {
                imageView.image = UIImage.init(named: imageArr[i])
            }
            self.guidePageView.addSubview(imageView)
            
            // 最后一张图添加体验按钮
            if i == imageArr.count - 1 {
                imageView.isUserInteractionEnabled = true
                let startButton = UIButton.init(frame: CGRect(x: kScreenWidth * 0.1, y: kScreenHeight * 0.8, width: kScreenWidth * 0.8, height: kScreenHeight * 0.08))
                startButton.setTitle("立即体验", for: .normal)
                startButton.setBackgroundImage(UIImage.init(named: "guide_btn_bg"), for: .normal)
                startButton.setTitleColor(UIColor.white, for: .normal)
                startButton.addTarget(self, action: #selector(skipButtonClick), for: .touchUpInside)
                imageView.addSubview(startButton)
            }
        }
    }
    
    func addPageControl() {
        self.guidePageControl = UIPageControl.init(frame: CGRect(x: 0, y: kScreenHeight * 0.9, width: kScreenWidth, height: kScreenHeight * 0.1))
        guidePageControl?.numberOfPages = self.imageArr?.count ?? 0
        guidePageControl?.pageIndicatorTintColor = UIColor.gray
        guidePageControl?.currentPageIndicatorTintColor = UIColor.white
        addSubview(guidePageControl!)
    }
}

// 代理方法
extension TMGuidePage : UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / kScreenWidth
        self.guidePageControl?.currentPage = Int(page)
    }
}
