//
//  ViewController.m
//  moveBtn
//
//  Created by 上海钢猫有限公司 on 16/6/29.
//  Copyright © 2016年 上海钢猫有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIButton *moveBtn;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testMove];
}

-(void)testMove {
    moveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    moveBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2-30, [UIScreen mainScreen].bounds.size.height/2-30, 60, 60);
    moveBtn.backgroundColor = [UIColor redColor];
    moveBtn.layer.cornerRadius = 30;
    moveBtn.layer.masksToBounds = YES;
    [self.view addSubview:moveBtn];
    
    [moveBtn addTarget:self action:@selector(dragMoving:withEvent: )forControlEvents: UIControlEventTouchDragInside];
//    [moveBtn addTarget:self action:@selector(doClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) dragMoving: (UIButton *)btn withEvent:(UIEvent *)event {
    
    CGPoint point = [[[event allTouches] anyObject] locationInView:self.view];
    CGFloat x = point.x;
    CGFloat y = point.y;
    CGFloat btnx = btn.frame.size.width/2;
    CGFloat btny = btn.frame.size.height/2;

    if(x<=btnx) {
        point.x = btnx;
    }
    if(x >= self.view.bounds.size.width - btnx) {
        point.x = self.view.bounds.size.width - btnx;
    }
    
    NSLog(@"fs:%f %f",x, btnx);
    btn.center = point;
    NSLog(@"%f,%f",btn.center.x,btn.center.y);
}

@end
