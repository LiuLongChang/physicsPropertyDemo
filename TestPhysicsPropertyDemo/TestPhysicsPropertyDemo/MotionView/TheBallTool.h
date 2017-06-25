//
//  TheBallTool.h
//  TestPhysicsPropertyDemo
//
//  Created by 刘隆昌 on 2017/6/25.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface TheBallTool : NSObject


@property(nonatomic,weak)UIView* referenceView;


+(instancetype)shareBallTool;

-(void)addAimView:(UIView*)ballView referenceView:(UIView*)referenceView;

-(void)stopMotionUpdates;



@end
