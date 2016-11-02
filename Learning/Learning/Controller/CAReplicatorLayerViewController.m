//
//  CAReplicatorLayerViewController.m
//  Learning
//
//  Created by 蔡晶 on 16/10/26.
//  Copyright © 2016年 WHBK. All rights reserved.
//
// 感谢 www.raywenderlich.com 提供的tutorial系列

#import "CAReplicatorLayerViewController.h"

@interface CAReplicatorLayerViewController ()


@property (nonatomic, strong) CAReplicatorLayer *replicatorLayer;

@end

@implementation CAReplicatorLayerViewController

- (void)viewDidLoad {
    
    _replicatorLayer = [CAReplicatorLayer layer];

//    [self p_addAnimation1];
    [self p_addAnimation2];
//    [self p_addAnimation3];
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)p_addAnimation3{
    
    _replicatorLayer.bounds = self.view.bounds;
    _replicatorLayer.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.75].CGColor;
    _replicatorLayer.position = self.view.center;
    [self.view.layer addSublayer:_replicatorLayer];

    CALayer *dot = [CALayer layer];
    dot.bounds = CGRectMake(0, 0, 10, 10);
    dot.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.75].CGColor;
    dot.borderColor = [UIColor whiteColor].CGColor;
    dot.borderWidth = 1.0;
    dot.cornerRadius = 5.0;
    dot.shouldRasterize = YES;
    
    dot.rasterizationScale = [UIScreen mainScreen].scale;
    
    [_replicatorLayer addSublayer:dot];
    
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnimation.path = [self p_getBezierPath];
    moveAnimation.repeatCount = CGFLOAT_MAX;
    moveAnimation.duration = 2;
    [dot addAnimation:moveAnimation forKey:@""];
    _replicatorLayer.instanceCount = 20;
    _replicatorLayer.instanceDelay = 0.05;
    _replicatorLayer.instanceColor = [UIColor colorWithRed:0.0 green:1.0 blue:0 alpha:0.9].CGColor;
    _replicatorLayer.instanceAlphaOffset = 0.03;
    _replicatorLayer.instanceGreenOffset = -0.05;
}


- (CGPathRef)p_getBezierPath{
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(31.5, 71.5)];
    [path addLineToPoint:CGPointMake(31.5, 23.5)];
    [path addCurveToPoint:CGPointMake(58.5, 38.5) controlPoint1:CGPointMake(31.5, 23.5) controlPoint2:CGPointMake(62.46, 18.69)];
    [path addCurveToPoint:CGPointMake(53.5, 45.5) controlPoint1:CGPointMake(57.5, 43.5) controlPoint2:CGPointMake(53.5, 45.5)];
    [path addLineToPoint:CGPointMake(43.5, 48.5)];
    [path addLineToPoint:CGPointMake(53.5, 66.5)];
    [path addLineToPoint:CGPointMake(62.5, 51.5)];
    [path addLineToPoint:CGPointMake(70.5, 66.5)];
    [path addLineToPoint:CGPointMake(86.5, 23.5)];
    [path addLineToPoint:CGPointMake(86.5, 78.5)];
    [path addLineToPoint:CGPointMake(31.5, 78.5)];
    [path addLineToPoint:CGPointMake(31.5, 71.5)];
    [path closePath];
    
    CGAffineTransform t = CGAffineTransformMakeScale(3.0, 3.0);
    
    return CGPathCreateCopyByTransformingPath(path.CGPath, &t);
    
}

- (void)p_addAnimation2{
    
    _replicatorLayer.bounds = CGRectMake(0, 0, 200, 200);
    _replicatorLayer.position = self.view.center;
    _replicatorLayer.cornerRadius = 10;
    _replicatorLayer.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.75].CGColor;
    [self.view.layer addSublayer:_replicatorLayer];
    
    CALayer *dotLayer = [CALayer layer];
    dotLayer.bounds = CGRectMake(0, 0, 14, 14);
    dotLayer.position = CGPointMake(100, 40);
    dotLayer.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0].CGColor;
    dotLayer.borderColor = [UIColor whiteColor].CGColor;
    dotLayer.borderWidth = 1.0;
    dotLayer.cornerRadius = 7.0;
    
    [_replicatorLayer addSublayer:dotLayer];
    
    _replicatorLayer.instanceCount = 15;
    float angel = 2 * M_PI / (CGFloat)15;
    //x y z合成一个向量值
    _replicatorLayer.instanceTransform = CATransform3DMakeRotation(angel, 0, 0, 1);
    
    NSTimeInterval duration = 1.0f;
    CABasicAnimation *shrink = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    shrink.duration = duration;
    shrink.fromValue = @(1.0);
    shrink.toValue = @(0.1);
    shrink.repeatCount = CGFLOAT_MAX;
    
    _replicatorLayer.instanceDelay = duration/15.f;
    [dotLayer addAnimation:shrink forKey:@""];
    
    dotLayer.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    Class cl = NSClassFromString(@"SocketViewController");
    [self.navigationController pushViewController:cl.new animated:YES];
}

- (void)p_addAnimation1{
    
    _replicatorLayer.bounds = CGRectMake(0, 0, 60, 60);
    _replicatorLayer.position = self.view.center;
    _replicatorLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    [self.view.layer addSublayer:_replicatorLayer];
    
    CALayer *repedLayer = [CALayer layer];
    repedLayer.bounds = CGRectMake(0, 0, 8.0, 40);
    repedLayer.position = CGPointMake(10, 75);
    repedLayer.cornerRadius = 2.0;
    repedLayer.backgroundColor = [UIColor redColor].CGColor;
    [_replicatorLayer addSublayer:repedLayer];
    
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    moveAnimation.fromValue = @(repedLayer.position.y - 35);
    moveAnimation.duration = 0.5;
    moveAnimation.autoreverses = YES;
    moveAnimation.repeatCount = CGFLOAT_MAX;
    [repedLayer addAnimation:moveAnimation forKey:@"moveAnimation"];
    //设置要复制的实例的个数
    _replicatorLayer.instanceCount = 3;
    _replicatorLayer.instanceTransform = CATransform3DMakeTranslation(20.0, 0, 20);
    _replicatorLayer.instanceDelay  = 0.33;
    _replicatorLayer.masksToBounds = YES;
}

@end
