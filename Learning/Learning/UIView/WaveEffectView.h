//
//  WaveEffectView.h
//  Learning
//
//  Created by 蔡晶 on 16/10/19.
//  Copyright © 2016年 WHBK. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^finishBlock)();

@interface WaveEffectView : UIView

@property (nonatomic,copy) finishBlock translateBlock;
-(void)clickAnimation;

@end
