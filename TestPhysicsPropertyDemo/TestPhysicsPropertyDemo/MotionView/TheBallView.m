//
//  TheBallView.m
//  TestPhysicsPropertyDemo
//
//  Created by 刘隆昌 on 2017/6/25.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

#import "TheBallView.h"
#import "TheBallTool.h"

@interface TheBallView()

@property(nonatomic,assign)UIDynamicItemCollisionBoundsType collisionBoundsType;
@property(nonatomic,strong)TheBallView * ball;


@end


@implementation TheBallView

@synthesize collisionBoundsType;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame andImgName:(NSString*)imgName{
    if (self = [super initWithFrame:frame]) {
        self.image = [UIImage imageNamed:imgName];
        self.layer.cornerRadius = frame.size.width*0.5;
        self.layer.masksToBounds = YES;
        self.collisionBoundsType = UIDynamicItemCollisionBoundsTypeEllipse;
    }
    return self;
}

-(void)starMotion{
    TheBallTool * ball = [TheBallTool shareBallTool];
    [ball addAimView:self referenceView:self.superview];
}



@end
