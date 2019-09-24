//
//  NSObject+VCCAlete.m
//  AFNetworking
//
//  Created by alete on 2019/8/8.
//

#import "NSObject+VCCAlete.h"
#import "VccAlete.h"
#import <objc/runtime.h>
@implementation NSObject (VCCAlete)
-(id)vcc{
    id alete = objc_getAssociatedObject(self, @"uiviewVcc");
    if (alete == nil) {
        alete = [[VccAlete alloc]init];
        [self setVcc:alete];
    }
    return alete ;
}
-(void)setVcc:(id)vcc{
    [self willChangeValueForKey:@"uiviewVcc"];
    objc_setAssociatedObject(self, @"uiviewVcc", vcc, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"uiviewVcc"];
}

-(void)dispose{
//    objc_setAssociatedObject(self, @"uiviewVcc", nil, OBJC_ASSOCIATION_ASSIGN);
    objc_removeAssociatedObjects(self);
}

@end
