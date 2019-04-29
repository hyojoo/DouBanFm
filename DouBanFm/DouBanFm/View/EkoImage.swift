//
//  EkoImage.swift
//  DouBanFm
//
//  Created by Caulifeld on 2019/4/29.
//  Copyright © 2019 caulifeld. All rights reserved.
//

import UIKit

//自定义圆角图标
class EkoImage: UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.clipsToBounds = true
        //设置圆角
        self.layer.cornerRadius = self.frame.size.width/2
        //设置边框
        self.layer.borderWidth = 4
        //设置背景色
        self.layer.backgroundColor = UIColor (red: 1, green: 1, blue: 1, alpha: 0.7).cgColor
        
    }
//    动画旋转
    func onRotaion(){
//        动画实例关键字
        let  animation = CABasicAnimation(keyPath: "transform.rotation")
//        初始值
        animation.fromValue = 0.0
//        结束值
        animation.toValue = .pi*2.0
//        动画执行时间
        animation.duration = 20
//        动画执行次数
        animation.repeatCount = 10000
        
        self.layer.add(animation, forKey: "")
    }
}


