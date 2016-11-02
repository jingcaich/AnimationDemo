//
//  XView.m
//  111
//
//  Created by 蔡晶 on 16/1/29.
//  Copyright © 2016年 蔡晶. All rights reserved.
//

#import "XView.h"

@implementation XView

- (void)drawRect:(CGRect)rect{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 10.0);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextMoveToPoint(context, 110.0, 110.0);
    CGContextAddLineToPoint(context, 220.0, 220.0);
    CGContextStrokePath(context);
    
    UIImage *image = [UIImage imageNamed:@"user_icon_account"];
    
    CGPoint drawPoint = CGPointMake(50, 50);
    
    [image drawAtPoint:drawPoint];
    
    
     
    
}

@end
