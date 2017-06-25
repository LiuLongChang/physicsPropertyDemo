//
//  ViewController.m
//  TestPhysicsPropertyDemo
//
//  Created by 刘隆昌 on 2017/6/25.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

#import "ViewController.h"
#import "TheBallView.h"
#import "TheBallTool.h"

@interface ViewController ()

@property(nonatomic,strong)NSArray * array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.array = @[@"大师球",@"高级球",@"超级球",@"精灵球"];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    TheBallView * ballView = [[TheBallView alloc] initWithFrame:CGRectMake(0, 80, 50, 50) andImgName:self.array[arc4random_uniform(4)]];
    [self.view addSubview:ballView];
    [ballView starMotion];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    [[TheBallTool shareBallTool] stopMotionUpdates];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
