//
//  CJTimer.m
//  111
//
//  Created by 蔡晶 on 16/3/30.
//  Copyright © 2016年 蔡晶. All rights reserved.
//

#import "CJTimer.h"


@interface CJTimer ()


@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) NSString *abk;

@end

@implementation CJTimer

+ (void)load{
    
}

- (instancetype)init{
    if (self = [super init]) {
        _abk = @"123";
    }
    return self;
}

+ (NSTimer *)CJTimerStartSscheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeats andDoAction:(timerAction)action{
        
    return [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(Action :) userInfo:[action copy] repeats:repeats];;
}

+ (void)Action:(NSTimer *)timer{
    timerAction block = timer.userInfo;
    block();
}


@end
