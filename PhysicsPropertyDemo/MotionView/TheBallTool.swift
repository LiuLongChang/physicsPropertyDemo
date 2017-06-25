//
//  TheBallTool.swift
//  PhysicsPropertyDemo
//
//  Created by 刘隆昌 on 2017/6/25.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

import UIKit
import CoreMotion



let _ball = TheBallTool()


class TheBallTool: NSObject {
    
    var referenceView : UIView!
    
    var onceToken : CLong!
    
    static func shareBallTool()->TheBallTool{
            return _ball
    }
    
    func addAimView(ballView:UIView,referenceView:UIView){
        
        self.referenceView = referenceView
        self.dynamic.addItem(ballView)
        self.collision.addItem(ballView)
        self.gravity.addItem(ballView)
        self.run()
    }
    
    
    func run(){
        if !self.manager.isDeviceMotionAvailable {
            NSLog("%@", "换手机吧 真机");return;
        }
        
        self.manager.deviceMotionUpdateInterval = 0.01;
        self.manager.startDeviceMotionUpdates(to: OperationQueue.main) { (motion:CMDeviceMotion?, error:Error?) in
            
            if error != nil {
                NSLog("出错了 \(String(describing: error))");return;
            }
            self.gravity.gravityDirection = CGVector.init(dx: (motion?.gravity.x)!*3, dy: -(motion?.gravity.y)!*3)
        }
    
    }
    
    
    
    //MARK: - 停止运动
    func stopMotionUpdates(){
        if self.manager.isDeviceMotionActive {
            self.manager.stopDeviceMotionUpdates()
            self.animator.removeAllBehaviors()
            onceToken = 0;
        }
    }
    
    
    //MARK: - 运动管理者
    var _manager : CMMotionManager!
    var manager : CMMotionManager!{
        get{
            if _manager == nil {
                _manager = CMMotionManager()
            };return _manager
        }
        set{
            _manager = newValue
        }
    }
    
    
    //MARK: 动态媒介
    var _animator : UIDynamicAnimator!
    var animator : UIDynamicAnimator!{
        set{
            _animator = newValue
        }
        get{
            if _animator == nil {
                _animator = UIDynamicAnimator.init(referenceView: self.referenceView)
            };return _animator;
        }
    }
    
    //MARK: 重力
    var _gravity : UIGravityBehavior!
    var gravity : UIGravityBehavior! {
        set{
            _gravity = newValue
        }
        get{
            if _gravity == nil {
                _gravity = UIGravityBehavior()
                self.animator.addBehavior(_gravity)
            };return _gravity;
        }
    }
    
    //MARK: 碰撞
    var _collision : UICollisionBehavior!
    var collision : UICollisionBehavior!{
        set{
            _collision = newValue
        }
        get{
            if _collision == nil {
                _collision = UICollisionBehavior()
                _collision.translatesReferenceBoundsIntoBoundary = true;
                _collision.collisionMode = .everything
                self.animator.addBehavior(_collision)
            };return _collision;
        }
    }
    
    //MARK: 动力学属性
    var _dynamic : UIDynamicItemBehavior!
    var dynamic : UIDynamicItemBehavior!{
        set{
            _dynamic = newValue
        }
        get{
            if _dynamic == nil {
                _dynamic = UIDynamicItemBehavior()
                _dynamic.friction = 0.2;
                _dynamic.elasticity = 0.8
                _dynamic.density = 0.2;
                _dynamic.allowsRotation = true
                _dynamic.resistance = 0;
                self.animator.addBehavior(_dynamic)
            };return _dynamic;
        }
    }
    
    
    
    
    
    
    
}
