//
//  NSDate+Common.m
//  Common
//
//  Created by alete on 2019/4/11.
//  Copyright © 2019 aletevcc. All rights reserved.
//

#import "NSDate+Common.h"
#import "NSDateFormatter+Alete.h"
@implementation NSDate (Common)

+(NSDateFormatter *)formatter{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"YYYY MM-dd HH:mm:ss" ;
    return formatter ;
    
}

+(NSString *)stringFromNowDate{
    NSDate *date = [NSDate date] ;
    return [[self formatter] stringFromDate:date];
}

+ (NSString *)returnDateStrWithTime:(NSTimeInterval)time
{
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:time / 1000];
    NSCalendarUnit unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekOfYear | NSCalendarUnitWeekdayOrdinal | NSCalendarUnitWeekday | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents * messageDateComponents = [calendar components:unitFlags fromDate:date];
    NSDateComponents * todayDateComponents = [calendar components:unitFlags fromDate:[NSDate date]];
    
    NSUInteger dayOfYearForMessage = [calendar ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitYear forDate:date];
    NSUInteger dayOfYearForToday = [calendar ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitYear forDate:[NSDate date]];
    
    NSString * dateStr = @"";
    if (messageDateComponents.year == todayDateComponents.year && messageDateComponents.month == todayDateComponents.month && messageDateComponents.day == todayDateComponents.day)
    {
        dateStr = [NSString stringWithFormat:@"%02zi:%02zi" , messageDateComponents.hour , messageDateComponents.minute];
    }
    else if (messageDateComponents.year == todayDateComponents.year && dayOfYearForMessage == (dayOfYearForToday - 1))
    {
        dateStr = [NSString stringWithFormat:@"%@ %02zi:%02zi" ,NSLocalizedString(@"昨天", nil), messageDateComponents.hour , messageDateComponents.minute];
    }
    else
    {
        NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.timeZone = [NSTimeZone localTimeZone];
        dateFormatter.dateFormat = @"YYYY-MM-dd";
        dateStr = [dateFormatter stringFromDate:date];
    }
    return dateStr;
}


+(BOOL)compareTimeWithStartTime:(NSInteger)startTime{
    
    NSTimeInterval startInterval = startTime/1000;
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now = [dat timeIntervalSince1970]*1;
    
    NSTimeInterval cha = now - startInterval;
    
    if (cha > 120) {
        return NO;
    }else{
        return YES;
    }
}

/*距离当前的时间间隔描述*/
- (NSString *)timeIntervalDescription
{
    NSTimeInterval timeInterval = -[self timeIntervalSinceNow];
    if (timeInterval < 60) {
        return NSLocalizedString(@"1分钟内",nil);
    } else if (timeInterval < 3600) {
        return [NSString stringWithFormat:NSLocalizedString(@"%.f分钟前",nil), timeInterval / 60];
    } else if (timeInterval < 3600*24) {
        return [NSString stringWithFormat:NSLocalizedString(@"%.f小时前",nil), timeInterval / 3600];
    } else if (timeInterval < 2592000) {//30天内
        return [NSString stringWithFormat:NSLocalizedString(@"%.f天前",nil), timeInterval / 86400];
    } else if (timeInterval < 31536000) {//30天至1年内
        NSDateFormatter *dateFormatter = [NSDateFormatter dateFormatterWithFormat:NSLocalizedString(@"M月d日",nil)];
        return [dateFormatter stringFromDate:self];
    } else {
        return [NSString stringWithFormat:NSLocalizedString(@"%.f年前",nil), timeInterval / 31536000];
    }
}



@end
