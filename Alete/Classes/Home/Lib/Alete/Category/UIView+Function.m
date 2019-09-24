//
//  UIView+Function.m
//  AFNetworking
//
//  Created by alete on 2019/8/8.
//

#import "UIView+Function.h"
#import "VccAlete.h"
@implementation UIView (Function)

-(VccAlete *)vcc{
    VccAlete *alete = [super vcc];
    if (alete.object == nil) {
        alete.object = [[VCRFuncTool alloc]init];
        alete.classObject = self ;
    }
    return alete ;
}
-(VccAlete<UIView *,VCRBrowerFuncShow *> *)alete{
    VccAlete *alete = [super vcc];
    if (alete.object == nil) {
        alete.object = [[VCRBrowerFuncShow alloc]init];
        alete.classObject = self ;
    }
    return alete ;
}
@end
