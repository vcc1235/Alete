//
//  BaseModel.m
//  AFNetworking
//
//  Created by alete on 2019/7/17.
//

#import "BaseModel.h"
#import "YYModel.h"

@implementation BaseModel

@synthesize code;
@synthesize msg;
@synthesize resultArray;
@synthesize resultObject;
/// 用作与持久化存储功能
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super init]) {
        [self yy_modelInitWithCoder:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self yy_modelEncodeWithCoder:aCoder];
}

- (void)vc_modelSetWithJSON:(nonnull id)object {
    if ([object isKindOfClass:[NSArray class]]) {  /// 判断是否为数组
        NSArray *array = [NSArray yy_modelArrayWithClass:self.class json:object];
        if (array != nil) {
            [self setValue:array forKey:@"resultArray"];
        }
    }else if([object isKindOfClass:[NSDictionary class]]){  /// 判断是否为字典
        if ([self respondsToSelector:@selector(resultForKey)]) {   /// 判断是字典某个key 的value 转化
            NSString *key = [self resultForKey];
            if (key == nil) {   /// 字典本身转化
                [self yy_modelSetWithJSON:object];
            }else{    /// 字典某个value的转化
                id obj = [object valueForKey:key];  /// 得到新的值
                [self vc_modelSetWithJSON:obj];  /// 递归转化
            }
        }else{
            [self yy_modelSetWithJSON:object];
        }
    }
}

-(NSString *)resultForKey{
    return nil ;
}

@end

@interface NSObject (BaseModel)



@end

@implementation NSObject (BaseModel)
-(NSString *)resultForKey{
    return nil ;
}
-(void)vc_modelSetWithJSON:(id)object{
    if ([object isKindOfClass:[NSArray class]]) {  /// 判断是否为数组
        NSArray *array = [NSArray yy_modelArrayWithClass:self.class json:object];
        if (array != nil) {
            [self setValue:array forKey:@"resultArray"];
        }
    }else if([object isKindOfClass:[NSDictionary class]]){  /// 判断是否为字典
        if ([self respondsToSelector:@selector(resultForKey)]) {   /// 判断是字典某个key 的value 转化
            NSString *key = [self resultForKey];
            if (key == nil) {   /// 字典本身转化
                [self yy_modelSetWithJSON:object];
            }else{    /// 字典某个value的转化
                id obj = [object valueForKey:key];  /// 得到新的值
                [self vc_modelSetWithJSON:obj];  /// 递归转化
            }
        }
    }
}

@end
