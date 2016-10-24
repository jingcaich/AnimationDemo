//
//  WaveEffectViewController.m
//  Learning
//
//  Created by 蔡晶 on 16/10/19.
//  Copyright © 2016年 WHBK. All rights reserved.
//

#import "WaveEffectViewController.h"
#import "WaveEffectView.h"

@interface WaveEffectViewController ()

@end

@implementation WaveEffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor blackColor];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self.view];
    CGFloat width = 120;
    CGFloat height = 50;
    __block WaveEffectView *wave = [[WaveEffectView alloc] initWithFrame:CGRectMake(point.x-width/2.0, point.y-height/2.0,width, height)];
    [wave clickAnimation];
    [self.view addSubview:wave];
    wave.translateBlock = ^ {
        [wave removeFromSuperview];
        wave = nil;
    };
}



@end
