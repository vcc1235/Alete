//
//  NSDictionary+Alete.m
//  Alete
//
//  Created by alete on 2019/7/16.
//

#import "NSDictionary+Alete.h"

@implementation NSDictionary (Alete)
#pragma mark - 格式 -
-(NSString *)jsonString{
    NSData *data = self.jsonData ;
    NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    string = [string stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    return string ;
}
-(NSData *)jsonData{
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    return data ;
}
-(NSString *)queryString{
    NSMutableString *string = [[NSMutableString alloc]init];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([key isKindOfClass:[NSString class]]) {
            [string appendString:key];
        }else if ([key isKindOfClass:[NSNumber class]]){
            [string appendString:((NSNumber *)key).stringValue];
        }else{
            [string appendString:@""];
        }
        [string appendString:@"="];
        if ([obj isKindOfClass:[NSString class]]) {
            [string appendString:obj];
        }else if ([obj isKindOfClass:[NSNumber class]]){
            [string appendString:((NSNumber *)obj).stringValue];
        }
        else if ([obj isKindOfClass:[NSArray class]]) {
            NSArray *objs = (NSArray *)obj;
            NSMutableString *ids = [NSMutableString stringWithString:@"["];
            for (id consulDoctor in objs) {
                [ids appendFormat:@"'%@',",consulDoctor];
            }
            NSString *idStr = [NSString stringWithFormat:@"%@]",[ids substringWithRange:NSMakeRange(0, [ids length]-1)]];
            [string appendString:idStr];
        }
        else if([obj isKindOfClass:[NSDictionary class]]){
            [string appendString:((NSDictionary *)obj).jsonString];
        }else{
            [string appendString:@""];
        }
        [string appendString:@"&"];
    }];
    if (!string || string.length == 0 ) {
        return string ;
    }
    NSString *subString = [string substringToIndex:string.length-1];
    return subString ;
    
}


@end
