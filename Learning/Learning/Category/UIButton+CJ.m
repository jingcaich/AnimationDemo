//
//  UIButton+CJ.m
//  111
//
//  Created by 蔡晶 on 16/8/26.
//  Copyright © 2016年 蔡晶. All rights reserved.
//

#import "UIButton+CJ.h"

@implementation UIButton (CJ)

+ (instancetype)CJ_buttonAllWithTitle:(NSString *)title
                          fontSize:(CGFloat)fontSize
                     selectedTitle:(NSString *)selectedTitle
                        titleColor:(UIColor *)titleColor
                selectedTitleColor:(UIColor *)selectedColor
                         imageName:(NSString *)imageName
                 selectedImageName:(NSString *)selectedImageName
               backgroundImageName:(NSString *)backgroundImageName
       selectedBackgroundImageName:(NSString *)selectedBackgroundImageName
                   backgroundColor:(UIColor *)backgroundColor{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitle:selectedTitle forState:UIControlStateSelected];
    
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setTitleColor:selectedColor forState:UIControlStateSelected];
    
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    
    [btn setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selectedBackgroundImageName] forState:UIControlStateSelected];
    
    [btn setBackgroundColor:backgroundColor];
    
    return btn;
}

+ (instancetype)CJ_buttonNormalWithTitle:(NSString *)title
                                fontSize:(CGFloat)fontSize
                              titleColor:(UIColor *)titleColor
                               imageName:(NSString *)imageName
                     backgroundImageName:(NSString *)backgroundImageName
                         backgroundColor:(UIColor *)backgroundColor{
    
    UIButton *btn = [self CJ_buttonAllWithTitle:title fontSize:(CGFloat)fontSize selectedTitle:nil titleColor:titleColor selectedTitleColor:nil imageName:imageName selectedImageName:nil backgroundImageName:backgroundImageName selectedBackgroundImageName:nil  backgroundColor:backgroundColor];
    
    return btn;
}


+ (instancetype)CJ_buttonNormalbaseWithTitle:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor{
    
    return [self CJ_buttonNormalWithTitle:title fontSize:fontSize titleColor:titleColor imageName:nil backgroundImageName:nil backgroundColor:backgroundColor];
}

@end
