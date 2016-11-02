//
//  CJTimer.h
//  111
//
//  Created by 蔡晶 on 16/3/30.
//  Copyright © 2016年 蔡晶. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^timerAction)();

@interface CJTimer : NSObject
@property (nonatomic, strong) timerAction actionBK;

@property (nonatomic, strong, readonly) NSString *abk;

+ (NSTimer *)CJTimerStartSscheduledTimerWithTimeInterval:(NSTimeInterval )timeInterval repeats:(BOOL) repeats andDoAction:(timerAction )actionBK;


@end
