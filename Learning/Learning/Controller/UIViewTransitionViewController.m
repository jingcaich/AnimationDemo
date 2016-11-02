//
//  UIAnimationViewController.m
//  111
//
//  Created by 蔡晶 on 16/1/12.
//  Copyright © 2016年 蔡晶. All rights reserved.
//

#import "UIViewTransitionViewController.h"
#import "XView.h"
#import "CJTimer.h"
#import <CoreFoundation/CoreFoundation.h>
@interface UIViewTransitionViewController ()

@property (nonatomic,strong) UIView *containerView;

@property (nonatomic,strong) UIView *firstView;

@property (nonatomic,strong) UIView *secondView;

@property (nonatomic, weak) UIButton *btn;

@property (nonatomic, strong) CAGradientLayer *gra;
@end
static NSInteger i = 0;

NSInteger x = 0;
NSInteger y = 0;
static const NSTimeInterval duration = 1.0;

@implementation UIViewTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    UIButton *btn  = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [btn setBackgroundColor:[UIColor orangeColor]];
    [btn setTitle:@"点击进行翻转" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(animationAction) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(50, 100, 100, 20);
    [self.view addSubview:btn];
    self.btn = btn;
    
    [self initialViews];
}

- (void)animationAction{
    // options里面有各种动画组合
    if (i % 2 ==0) {
        [UIView transitionFromView:self.firstView toView:self.secondView duration:duration options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
            self.btn.userInteractionEnabled = finished;
            finished ? i++:i;
        }];
    }else
        
        [UIView transitionFromView:self.secondView toView:self.firstView duration:duration options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
            self.btn.userInteractionEnabled = finished;
            finished ? i++:i;
    }];
}
//有容器view之后就是正常的
- (void)initialViews{
    
    self.containerView = [[UIView alloc] init];
    self.containerView.height = 100;
    self.containerView.width  = 100;
    self.containerView.center = self.view.center;
    self.containerView.backgroundColor = [UIColor darkGrayColor];
    self.btn.frame = CGRectMake(self.containerView.x, self.containerView.y-self.btn.height, 100, 20);
    self.firstView = [[UIView alloc] init];
    self.firstView.backgroundColor = [UIColor orangeColor];
    self.firstView.width = 100;
    self.firstView.height = 100;
    self.firstView.x = 0;
    self.firstView.y = 0;
    self.secondView = [[UIView alloc] init];
    self.secondView.backgroundColor = [UIColor greenColor];
    self.secondView.width = 100;
    self.secondView.height= 100;
    self.secondView.x = 0;
    self.secondView.y = 0;
    
    [self.containerView addSubview:self.firstView];
    [self.containerView addSubview:self.secondView];
    [self.view addSubview:self.containerView];
    
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
