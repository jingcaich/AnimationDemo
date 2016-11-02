//
//  UILabel+CJ.h
//  111
//
//  Created by 蔡晶 on 16/8/26.
//  Copyright © 2016年 蔡晶. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CJ)

+ (instancetype)CJ_labelWithText:(NSString *)text
                        fontSize:(CGFloat)fontSize
                       textColor:(UIColor *)textColor
                 backgroundColor:(UIColor *)backgroundColor;

@end
