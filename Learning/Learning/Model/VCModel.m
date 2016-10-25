//
//  VCModel.m
//  Learning
//
//  Created by 蔡晶 on 16/10/19.
//  Copyright © 2016年 WHBK. All rights reserved.
//

#import "VCModel.h"

@implementation VCModel

+ (instancetype)VCModelWithTitle:(NSString *)title VCName:(NSString *)VCName{
    
    VCModel *model = [[VCModel alloc] init];
    model.title =title;
    model.VCName = VCName;
    
    return model;
}

@end
