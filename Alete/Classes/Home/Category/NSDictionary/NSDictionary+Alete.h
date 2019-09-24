//
//  NSDictionary+Alete.h
//  Alete
//
//  Created by alete on 2019/7/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (Alete)
/**
 字典转字符串
 @return return value description
 */
-(NSString *)jsonString ;

/**
 字典转Data
 @return return value description
 */
-(NSData *)jsonData ;

/**
 字典转 Query
 @return return value description
 */
-(NSString *)queryString ;
@end

NS_ASSUME_NONNULL_END
