//
//  UIButton+CJ.h
//  111
//
//  Created by 蔡晶 on 16/8/26.
//  Copyright © 2016年 蔡晶. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CJ)

+ (instancetype)CJ_buttonAllWithTitle:(NSString *)title
                          fontSize:(CGFloat)fontSize
                     selectedTitle:(NSString *)selectedTitle
                        titleColor:(UIColor *)titleColor
                selectedTitleColor:(UIColor *)selectedColor
                         imageName:(NSString *)imageName
                 selectedImageName:(NSString *)selectedImageName
               backgroundImageName:(NSString *)backgroundImageName
       selectedBackgroundImageName:(NSString *)selectedBackgroundImageName
                   backgroundColor:(UIColor *)backgroundColor ;

+ (instancetype)CJ_buttonNormalWithTitle:(NSString *)title
                          fontSize:(CGFloat)fontSize
                        titleColor:(UIColor *)titleColor
                         imageName:(NSString *)imageName
               backgroundImageName:(NSString *)backgroundImageName
                   backgroundColor:(UIColor *)backgroundColor ;


+ (instancetype)CJ_buttonNormalbaseWithTitle:(NSString *)title
                          fontSize:(CGFloat)fontSize
                        titleColor:(UIColor *)titleColor
                   backgroundColor:(UIColor *)backgroundColor ;


@end
