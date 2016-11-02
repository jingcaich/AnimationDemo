//
//  UILabel+CJ.m
//  111
//
//  Created by 蔡晶 on 16/8/26.
//  Copyright © 2016年 蔡晶. All rights reserved.
//

#import "UILabel+CJ.h"

@implementation UILabel (CJ)


+ (instancetype)CJ_labelWithText:(NSString *)text
                        fontSize:(CGFloat)fontSize
                       textColor:(UIColor *)textColor
                 backgroundColor:(UIColor *)backgroundColor{
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = textColor;
    label.backgroundColor = backgroundColor;
    
    return label;
}


@end
