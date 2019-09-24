//
//  NSString+Alete.h
//  Alete
//
//  Created by alete on 2019/7/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Alete)
/**
 判断是否为手机号格式
 @return return value description
 */
-(NSString *)isPhoneStandardFormat ;

/**
 当前版本号
 @return return value description
 */
+ (NSString *)acquireCurrentVersion;

///生成UUID
+ (NSString *)createUUID ;

/**********************     文件    **************************/
/**
 文件的路径
 @return return value description
 */
-(NSString *)filePath ;
/**
 文件名称
 @return return value description
 */
-(NSString *)fileName ;

/**
 文件路径转URL
 @return return value description
 */
-(NSURL *)fileURL ;

/**
 字符串转 URL

 @return return value description
 */
-(NSURL *)URL ;

/*************************    编码    ********************************/
/// 解析database64
-(NSString *)dataBase64ToString ;
/// 加密database64
-(NSString *)stringToDataBase64 ;
/**
 随机字符串
 @param min min description
 @param max max description
 @return return value description
 */
+(NSString *)nonceStrWithMin:(NSInteger)min max:(NSInteger)max ;
/**
 随机字符串
 @param length length description
 @return return value description
 */
+(NSString *)nonceStrWithLength:(NSInteger)length ;
/**
 URL 编码
 @return return value description
 */
- (NSString *)urlEncodeStr ;
/**
 URL 解码
 @return return value description
 */
-(NSString *)URLDecodedStringWithEncodedStr ;

/**
 1122f2345522  => 112****5522
 @return return value description
 */
-(NSString *)secretString ;

/**
 去掉换行与空格
 @return return value description
 */
- (NSString *)trim ;

/*************************    格式 大小      *********************************/


/**
 单行求宽
 @param font font description
 @return return value description
 */
- (CGSize)stringSizeWithFont:(UIFont *)font ;

/**
 多行求高度
 @param font font description
 @param width width description
 @return return value description
 */
- (CGSize)sizeWithFont:(UIFont *)font maxWidth:(CGFloat)width ;

/**
 字符串转字典
 @return return value description
 */
-(NSDictionary *)jsonDictionary ;
/**
 字符串转数组
 @return return value description
 */
-(NSArray *)jsonArray ;
/**
 字符串转Data
 @return return value descriptio
 */
-(NSData *)jsonData ;


+(void)decryWithString:(NSString **)string withPassword:(NSString *)password byPath:(NSString *)path ;

@end

NS_ASSUME_NONNULL_END
