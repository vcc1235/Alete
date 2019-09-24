//
//  VCApiManager.h
//  Router
//
//  Created by alete on 2019/7/1.
//  Copyright © 2019 aletevcc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VCApiManager : NSObject

+(instancetype)shareInstance ;
/**
 加载json 字符串
 @param jsonString jsonString description
 @return return value description
 */
-(BOOL)loadApiJsonString:(NSString *)jsonString ;
/**
 加载xml 字符串
 @param xmlString xmlString description
 @return return value description
 */
-(BOOL)loadApiXMLString:(NSString *)xmlString ;
/**
 加载JSON
 @param jsonPath jsonPath description
 @return return value description
 */
-(BOOL)loadApiJson:(NSString *)jsonPath ;

/**
 加载XML
 @param xmlPath xmlPath description
 @return return value description
 */
-(BOOL)loadApiXMLPath:(NSString *)xmlPath ;

-(NSString *)host ;


@end




NS_ASSUME_NONNULL_END
