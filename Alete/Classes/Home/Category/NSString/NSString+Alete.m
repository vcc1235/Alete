//
//  NSString+Alete.m
//  Alete
//
//  Created by alete on 2019/7/16.
//

#import "NSString+Alete.h"
#import <UIKit/UIKit.h>
#import "RNDecryptor.h"
#import "NSString+Hash.h"

@implementation NSString (Alete)

-(NSString *)isPhoneStandardFormat{
    NSString * originStr = [NSString stringWithFormat:@"%@",self];
    NSMutableString * strippedString = [NSMutableString stringWithCapacity:originStr.length];
    NSScanner * scanner = [NSScanner scannerWithString:originStr];
    NSCharacterSet * numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    while ([scanner isAtEnd] == NO) {
        NSString * buffer;
        if ([scanner scanCharactersFromSet:numbers intoString:&buffer]) {
            [strippedString appendString:buffer];
        } else {
            [scanner setScanLocation:([scanner scanLocation] + 1)];
        }
    }
    return strippedString;
}

/**
 当前版本号
 @return return value description
 */
+ (NSString *)acquireCurrentVersion {
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = [infoDict objectForKey:@"CFBundleShortVersionString"];
    return currentVersion;
}

//生成UUID
+ (NSString *)createUUID
{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref = CFUUIDCreateString(NULL, uuid_ref);
    CFRelease(uuid_ref);
    NSString * uuid = (__bridge NSString *)uuid_string_ref;
    CFRelease(uuid_string_ref);
    return uuid;
}

/**
 文件的路径
 @return return value description
 */
-(NSString *)filePath{
    NSURL * documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    return [documentsDirectoryURL URLByAppendingPathComponent:self].path;
}
/**
 文件名称
 @return return value description
 */
-(NSString *)fileName{
    NSArray *list = [self componentsSeparatedByString:@"/"];
    return list.lastObject ;
}
/**
 文件路径转URL
 @return return value description
 */
-(NSURL *)fileURL{
    return [NSURL fileURLWithPath:self];
}
/// 字符串转 URL
-(NSURL *)URL{
    return [NSURL URLWithString:self];
}

#pragma mark - 编码 -
/// 解析database64
-(NSString *)dataBase64ToString {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}
/// 加密database64
-(NSString *)stringToDataBase64 {
    if (self == nil) {
        return nil ;
    }
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
}

/// 随机字符串
+(NSString *)nonceStrWithMin:(NSInteger)min max:(NSInteger)max{
    if (min>max) {
        return @"";
    }
    NSInteger index = (arc4random() % (max-min))+min ;
    return [self nonceStrWithLength:index];
}


/// 随机字符串
+(NSString *)nonceStrWithLength:(NSInteger)length{
    
    NSMutableString *ramdom = [[NSMutableString alloc]initWithCapacity:length];
    NSString *string = @"abcdefghigklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    for (int i = 0; i< length; i++) {
        int index = arc4random() % string.length ;
        NSString *s = [string substringWithRange:NSMakeRange(index, 1)];
        [ramdom appendString:s];
    }
    return ramdom;
    
}
/**
 *  URLEncode
 */
- (NSString *)urlEncodeStr{
    NSString *charactersToEscape = @"?!@#$^&%*+,:;='\"`<>()[]{}/\\| ";
    NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
    NSString *upSign = [self stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
    return upSign;
}
/**
 *  URLDecode
 */
-(NSString *)URLDecodedStringWithEncodedStr{
    NSString *decodedString  = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,(__bridge CFStringRef)self,CFSTR(""),CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    return decodedString;
}
-(NSString *)secretString{
    
    NSMutableString *mutableString = [[NSMutableString alloc]init];
    if (self.length<3) {
        return @"**";
    }else if(self.length<7){
        for (int i=0; i<self.length; i++) {
            if (i==0 ||  (i==self.length-1)) {
                [mutableString appendString:[self substringWithRange:NSMakeRange(i,1)]];
            }else{
                [mutableString appendString:@"*"];
            }
        }
    }else if(self.length<11){
        NSString *start = [self substringWithRange:NSMakeRange(0, 2)];
        NSString *end = [self substringFromIndex:self.length-2];
        [mutableString appendString:start];
        [mutableString appendString:@"***"];
        [mutableString appendString:end];
    }else{
        NSString *start = [self substringWithRange:NSMakeRange(0, 3)];
        NSString *end = [self substringFromIndex:self.length-4];
        [mutableString appendString:start];
        [mutableString appendString:@"****"];
        [mutableString appendString:end];
    }
    return mutableString ;
    
}
- (NSString *)trim {
    NSString *str =  [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return [str stringByReplacingOccurrencesOfString:@" " withString:@""];
}
#pragma mark - 格式 大小 -
- (CGSize)stringSizeWithFont:(UIFont *)font{
    return [self sizeWithAttributes:@{NSFontAttributeName:font}];
}
- (CGSize)sizeWithFont:(UIFont *)font maxWidth:(CGFloat)width {
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    return CGSizeMake(width, ceil(rect.size.height));
}
-(NSDictionary *)jsonDictionary{
    NSData *data = self.jsonData ;
    NSDictionary *dict = nil ;
    if (data) {
        dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    }
    return dict ;
}
-(NSArray *)jsonArray{
    NSData *data = self.jsonData ;
    NSArray *array = nil ;
    if (data) {
        array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    }
    return array ;
}
-(NSData *)jsonData{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}


+(void)decryWithString:(NSString **)string withPassword:(NSString *)password byPath:(NSString *)path{
    NSData *data = [NSData dataWithContentsOfFile:path];
    if (data == nil) {
        return   ;
    }
    NSError *error ;
    NSData *decryData = [RNDecryptor decryptData:data withSettings:(kRNCryptorAES256Settings) password:password.md5String error:&error];
    if (error) {
        return  ;
    }
    NSString *result = [[NSString alloc]initWithData:decryData encoding:NSUTF8StringEncoding];
    *string = result ;
}






@end
