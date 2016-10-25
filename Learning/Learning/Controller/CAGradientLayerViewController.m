//
//  CAGradientLayerViewController.m
//  Learning
//
//  Created by 蔡晶 on 16/10/25.
//  Copyright © 2016年 WHBK. All rights reserved.
//

#import "CAGradientLayerViewController.h"

@interface CAGradientLayerViewController ()

@end

@implementation CAGradientLayerViewController
// 比较见的类
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CAGradientLayer *caLayer = [CAGradientLayer layer];
    caLayer.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    caLayer.colors = @[(__bridge id)COLOR_HEX(0xf76c4d, 1).CGColor,(__bridge id)COLOR_HEX(0xe1464d, 1).CGColor];
    caLayer.startPoint = CGPointMake(0.5, 0);
    caLayer.endPoint = CGPointMake(0.5, 1);
    [self.view.layer addSublayer:caLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
