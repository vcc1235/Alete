//
//  AFFileManager.m
//  Common
//
//  Created by alete on 2019/3/22.
//  Copyright © 2019 aletevcc. All rights reserved.
//

#import "AFFileManager.h"
#import "NSDate+Common.h"
#import <NSString+Hash.h>

@implementation AFFileManager
/// filename 文件路径
+(id)parseJsonFile:(NSString *)filePath{
    
    if ([filePath isEqualToString:@""] || filePath==nil) {
        return nil;
    }
    NSError *error = nil ;
    NSRange range = [filePath rangeOfString:@"." options:(NSBackwardsSearch)];
    NSString *fileType = [filePath substringWithRange:NSMakeRange(range.location+1, filePath.length-range.location-1)];
    /// 判断是否为 plist 文件
    if ([fileType isEqualToString:@"plist"]) {
        id result = [NSDictionary dictionaryWithContentsOfFile:filePath];
        if (result) {
            return  result ;
        }else{
            return  [NSArray arrayWithContentsOfFile:filePath];
        }
    }
    NSString *json = [NSString stringWithContentsOfURL:[NSURL fileURLWithPath:filePath] encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        return nil ;
    }
    id result = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        return nil ;
    }
    return result ;
    
}
+(id)getLocalJsonDataByType:(NSString *)fileName{
    NSString *filePath = [NSBundle.mainBundle pathForResource:fileName ofType:nil];
    return [self parseJsonFile: filePath];
}

+(NSString *)createJSONFile{
    
    NSString *path = [self createDocument];
    NSString *name = [NSString stringWithFormat:@"conent_%@.json",@"sdaf"] ;
    NSString *file = [path stringByAppendingString:name];
    if ([NSFileManager.defaultManager fileExistsAtPath:file] == false) {
        [@{} writeToFile:file atomically:true];
    }
    return file ;
    
}

+(NSString *)createDocument{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject ;
    path = [path stringByAppendingPathComponent:@"/image"];
    BOOL is = false ;
    if ([NSFileManager.defaultManager fileExistsAtPath:path isDirectory:&is]) {
        if (is == false) {
            [NSFileManager.defaultManager createDirectoryAtPath:path withIntermediateDirectories:true attributes:nil error:nil];
        }
    }else{
        [NSFileManager.defaultManager createDirectoryAtPath:path withIntermediateDirectories:true attributes:nil error:nil];
    }
    
    return path ;
}


+(NSString *)createFileWithData:(NSData *)data{
    
    NSString *name = NSDate.stringFromNowDate.md5String;
    NSString *file = [[self createDocument]stringByAppendingString:name];
    [data writeToFile:file atomically:true];
    return file ;
    
}


+(void)saveContentWithId:(id)conent key:(NSString *)key{
    
    NSData *data  ;
    if ([conent isKindOfClass:NSString.class]) {
        data = [((NSString *)conent) dataUsingEncoding:NSUTF8StringEncoding];
    }else if ([conent isKindOfClass:NSArray.class]){
        data = [NSJSONSerialization dataWithJSONObject:conent options:NSJSONWritingPrettyPrinted error:nil];
    }else if ([conent isKindOfClass:NSDictionary.class]){
        data = [NSJSONSerialization dataWithJSONObject:conent options:NSJSONWritingPrettyPrinted error:nil];
    }else if ([conent isKindOfClass:NSData.class]){
        data = conent ;
    }
    NSString *file = [self createJSONFile];
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:file];
    [dictionary setObject:data forKey:key];
    [dictionary writeToFile:file atomically:true];
    
}

+(id)obtainContentWithKey:(NSString *)key{
    
    NSString *file = [self createJSONFile];
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:file];
    NSData *data = [dictionary objectForKey:key];
    if (data == nil) {
        return nil ;
    }
    id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    if (object == nil) {
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }else{
        return object ;
    }
}


/// 文件大小
+(long long) fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}



@end
