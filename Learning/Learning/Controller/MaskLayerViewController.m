//
//  MaskLayerViewController.m
//  Learning
//
//  Created by 蔡晶 on 16/10/25.
//  Copyright © 2016年 WHBK. All rights reserved.
//

#import "MaskLayerViewController.h"

@interface MaskLayerViewController ()
@property (nonatomic, strong) CALayer *maskLayer;

@end

@implementation MaskLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    // 这两种效果是不同的
    [self p_makeHole];// 改变镂空CAShapeLayer的大小 变为透明 小动画
//    [self p_useCAShapeLayer]; //非镂空 小动画演示
//    [self p_useCALyer]; // 改变成maskLayer的大小 可使用Slider
}
#pragma mark - private method
- (CALayer *)p_createMaskLayer{
    
    CALayer *layer = [CAShapeLayer layer];
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    layer.frame = CGRectMake(100, 100, 100, 100);
    
    return layer;
    
}

- (void)p_useCALyer{
    UIView *bgView = [[UIView alloc] initWithFrame:self.view.frame];
    bgView.alpha = 0.5;
    bgView.backgroundColor = [UIColor orangeColor];
    [self.view insertSubview:bgView atIndex:0];
    _maskLayer = [self p_createMaskLayer];
    bgView.layer.mask = _maskLayer;
}

- (void)p_useCAShapeLayer{
    UIButton * _maskButton = [[UIButton alloc] init];
    [_maskButton setFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    [_maskButton setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.7]];
    [self.view addSubview:_maskButton];
    // 直接use arc画圆 再到圆的变化 会出现奇怪的曲线变换 原因未知
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(SCREEN_WIDTH / 2 - 100, 100, 200, 200)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    
    [_maskButton.layer setMask:shapeLayer];
    
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    positionAnimation.duration = 0.5;
    positionAnimation.toValue  = @(_maskButton.center.y/2. - 64);
    positionAnimation.fillMode = kCAFillModeForwards;
    positionAnimation.removedOnCompletion = NO;
    
    
    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.beginTime = positionAnimation.duration;
    maskLayerAnimation.duration = 0.5;
    maskLayerAnimation.toValue = (__bridge id _Nullable) [UIBezierPath bezierPathWithArcCenter:self.view.center radius:520 startAngle:0 endAngle:M_PI * 2 clockwise:YES].CGPath;
    maskLayerAnimation.fillMode = kCAFillModeForwards;
    maskLayerAnimation.removedOnCompletion = NO;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = positionAnimation.duration + maskLayerAnimation.duration;
    animationGroup.removedOnCompletion = NO;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.animations = @[positionAnimation,maskLayerAnimation];
    
    [shapeLayer addAnimation:animationGroup forKey:@"positionAnimation"];
    
}

- (void)p_makeHole{
    
    UIButton * _maskButton = [[UIButton alloc] init];
    [_maskButton setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [_maskButton setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.7]];
    [self.view addSubview:_maskButton];
    
    //create path
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    // MARK: circlePath
    [path appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(SCREEN_WIDTH / 2, 200) radius:100 startAngle:0 endAngle:2*M_PI clockwise:NO]];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    [_maskButton.layer setMask:shapeLayer];
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [path1 appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(SCREEN_WIDTH / 2, 300) radius:100 startAngle:0 endAngle:2*M_PI clockwise:NO]];
    
    
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    positionAnimation.duration = 0.5;
    positionAnimation.toValue  = (__bridge id _Nullable) path1.CGPath;
    positionAnimation.fillMode = kCAFillModeForwards;
    positionAnimation.removedOnCompletion = NO;
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [path2 appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(SCREEN_WIDTH / 2, 300) radius:520 startAngle:0 endAngle:2*M_PI clockwise:NO]];
    
    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.beginTime = positionAnimation.duration;
    maskLayerAnimation.duration = 0.5;
    maskLayerAnimation.toValue = (__bridge id _Nullable) path2.CGPath;
    maskLayerAnimation.fillMode = kCAFillModeForwards;
    maskLayerAnimation.removedOnCompletion = NO;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = positionAnimation.duration + maskLayerAnimation.duration;
    animationGroup.removedOnCompletion = NO;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.animations = @[positionAnimation,maskLayerAnimation];
    
    [shapeLayer addAnimation:animationGroup forKey:@"positionAnimation"];
}

- (IBAction)A_slider:(id)sender {
    UISlider *slider = (UISlider *)sender;
    _maskLayer.frame = CGRectMake(0, 0, 375, 667*(1.0 -slider.value));
}


@end
