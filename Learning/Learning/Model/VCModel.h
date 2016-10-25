//
//  VCModel.h
//  Learning
//
//  Created by 蔡晶 on 16/10/19.
//  Copyright © 2016年 WHBK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VCModel : NSObject

@property (nonatomic, copy, readwrite) NSString *title;
@property (nonatomic, copy, readwrite) NSString *VCName;

+ (instancetype)VCModelWithTitle:(NSString *)title VCName:(NSString *)VCName;

@end
