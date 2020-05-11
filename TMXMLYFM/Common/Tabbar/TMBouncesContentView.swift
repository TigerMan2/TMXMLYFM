//
//  TMBouncesContentView.swift
//  TMXMLYFM
//
//  Created by Luther on 2020/5/11.
//  Copyright © 2020 mrstock. All rights reserved.
//

import UIKit

class TMBouncesContentView: TMBaseContentView {
    
    public var duration = 0.3
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func selectAnimation(animated: Bool, completion: (() -> ())?) {
        bouncesAnimated()
        completion?()
    }
    
    override func reselectAnimation(animated: Bool, completion: (() -> ())?) {
        bouncesAnimated()
        completion?()
    }
    
    func bouncesAnimated() {
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        animation.duration = duration * 2
        animation.calculationMode = CAAnimationCalculationMode.cubic
        imageView.layer.add(animation, forKey: nil)
    }
}
