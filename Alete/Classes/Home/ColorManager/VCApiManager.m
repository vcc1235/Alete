//
//  VCApiManager.m
//  Router
//
//  Created by alete on 2019/7/1.
//  Copyright © 2019 aletevcc. All rights reserved.
//

#import "VCApiManager.h"
#import <objc/runtime.h>
#import "XMLDictionary.h"
#import <Foundation/Foundation.h>

@interface VCApiManager ()

@property (nonatomic, strong) NSDictionary <NSString *,NSDictionary *>*dictioanry ;

@property (nonatomic, strong) NSMutableDictionary <NSString *,id>*mutableDictionary ;

@end

@implementation VCApiManager
-(NSMutableDictionary *)mutableDictionary{
    if (!_mutableDictionary) {
        _mutableDictionary = [[NSMutableDictionary alloc]init];
    }
    return _mutableDictionary ;
}


+(instancetype)shareInstance{
    
    static NSMutableDictionary *__VCRApidictionary = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __VCRApidictionary = [[NSMutableDictionary alloc]init];
    });
    VCApiManager *service = [__VCRApidictionary objectForKey:NSStringFromClass(self)];
    if (service == nil) {
        service = [[self alloc]init];
        [__VCRApidictionary setObject:service forKey:NSStringFromClass(self)];
    }
    return service ;
}


-(void)reloadApi{
    
    NSArray <NSString *> *classArray = self.dictioanry.allKeys ;
    for (NSString *classString in classArray) {
        if (classString == nil || classString.length==0) {
            continue ;
        }
        NSString *local = [self grateLargeCastFirstString:classString];
        id objc = [[NSClassFromString(local)  alloc]init];
        if (objc == nil) {
            NSLog(@"%@ class is null",local);
            continue ;
        }
        [self.mutableDictionary setObject:objc forKey:classString];
        [self setValue:objc forKey:[self lowercastFirstString:classString]];
        id val = [self valueForKey:[self lowercastFirstString:classString]];
        if (val == nil) {
            continue ;
        }
        NSDictionary <NSString *,NSString *>*valueDictionary = [self.dictioanry valueForKey:classString];
        NSString *host = [valueDictionary valueForKey:@"host"];
        if (host == nil) {
            host = [objc valueForKey:@"host"];
            if (host == nil) {
                host = self.host;
            }
        }
        [valueDictionary enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop) {
            NSString *url = [host stringByAppendingString:obj];
            [objc setValue:url forKey:key];
        }];
    }
    
}
-(BOOL)loadApiXMLString:(NSString *)xmlString{
    NSDictionary *dictionary = [XMLDictionaryParser.sharedInstance dictionaryWithString:xmlString];
    self.dictioanry = dictionary ;
    if (self.dictioanry == nil) {
        return false ;
    }
    [self reloadApi];
    return true ;
    
}
-(BOOL)loadApiJsonString:(NSString *)jsonString{
    self.dictioanry = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
    [self reloadApi];
    return true ;
}
-(BOOL)loadApiJson:(NSString *)jsonPath{
    NSDictionary *dictionary = [self readInterfaceValue:jsonPath];
    self.dictioanry = dictionary ;
    [self reloadApi];
    return true ;
}

-(BOOL)loadApiXMLPath:(NSString *)xmlPath{
    NSDictionary *dictionary = [XMLDictionaryParser.sharedInstance dictionaryWithFile:xmlPath];
    self.dictioanry = dictionary ;
    if (self.dictioanry == nil) {
        return false ;
    }
    [self reloadApi];
    return true ;
}

-(NSString *)grateLargeCastFirstString:(NSString *)string{
    
    if (string == nil) {
        return @"" ;
    }
    if (string.length == 1) {
        return string ;
    }
    NSString *value = [string substringFromIndex:1];
    NSString *key = [string substringWithRange:NSMakeRange(0, 1)];
    return [key.capitalizedString stringByAppendingString:value];
}

-(NSString *)lowercastFirstString:(NSString *)string{
    
    if (string == nil) {
        return @"" ;
    }
    if (string.length == 1) {
        return string ;
    }
    NSString *value = [string substringFromIndex:1];
    NSString *key = [string substringWithRange:NSMakeRange(0, 1)];
    return [key.lowercaseString stringByAppendingString:value];
}

-(NSString *)host{
    return @"http://api.vip0.com";
}

///读取模拟接口文档数据
- (NSDictionary *)readInterfaceValue:(NSString *)path {

    //带有注释的json文本
    NSString *allStr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSScanner *myScanner = [NSScanner scannerWithString:allStr];//扫描
    NSString *annotStr = nil;
    NSString *jsonStr = allStr;
    while ([myScanner isAtEnd] == NO) {
        //开始扫描
        [myScanner scanUpToString:@"##" intoString:NULL];
        [myScanner scanUpToString:@"\n" intoString:&annotStr];
        //将结果替换
        //注意 这样写jsonStr =  [jsonStr stringByReplacingOccurrencesOfString:annotStr withString:@""]; 无法区分json中的”// 事项“和”// 事项备注“ 两个注释
        jsonStr = [jsonStr stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@\n", annotStr] withString:@"\n"];
    }
    if (jsonStr == nil) {return nil;}
    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if(error) {
        NSLog(@"json解析失败：%@",error);
        return nil;
    }
    return resultDic;
}


@end
