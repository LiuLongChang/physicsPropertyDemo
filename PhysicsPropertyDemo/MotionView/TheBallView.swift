//
//  TheBallView.swift
//  PhysicsPropertyDemo
//
//  Created by 刘隆昌 on 2017/6/25.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

import UIKit

class TheBallView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    var _collisionBoundsType : UIDynamicItemCollisionBoundsType! = nil
    
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType{
        get{
            return _collisionBoundsType;
        }
        set{
            _collisionBoundsType = newValue;
        }
    }
    
    
    
    //override var collisionBoundsType : UIDynamicItemCollisionBoundsType!
    
    
    init(frame: CGRect,AndImgName imgName:String) {
        super.init(frame: frame)
        self.image = UIImage.init(named: imgName)
        self.layer.cornerRadius = frame.size.width*0.5
        self.layer.masksToBounds = true
        self.collisionBoundsType = .ellipse
    }
    
    func starMotion(){
        let ball = TheBallTool.shareBallTool()
        ball.addAimView(ballView: self, referenceView: self.superview!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
