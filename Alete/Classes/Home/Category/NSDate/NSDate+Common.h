//
//  NSDate+Common.h
//  Common
//
//  Created by alete on 2019/4/11.
//  Copyright © 2019 aletevcc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Common)

+(NSString *)stringFromNowDate ;

+ (NSString *)returnDateStrWithTime:(NSTimeInterval)time ;

/** 是否能够撤销 **/
+(BOOL)compareTimeWithStartTime:(NSInteger)startTime ;
/**
 时间的描述

 @return return value description
 */
- (NSString *)timeIntervalDescription ;

@end

NS_ASSUME_NONNULL_END
