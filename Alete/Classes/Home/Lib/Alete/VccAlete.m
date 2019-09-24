//
//  VccAlete.m
//  AFNetworking
//
//  Created by alete on 2019/8/8.
//

#import "VccAlete.h"
#import "NSObject+VCCAlete.h"
#import <objc/runtime.h>
#import "VCRFuncTool.h"
#import "VCRBrowerFuncShow.h"

@interface VccAlete ()

@property (nonatomic, copy) NSString *titleString ;

@property (nonatomic, strong) NSMutableArray *mutableArray ;

@property (nonatomic, strong) NSMutableDictionary <NSString *,handler>*mutableDictionary ;

@end

@interface VCRFuncTool (function)

@property (nonatomic, strong) VccAlete <UIView *,VCRFuncTool *>*vcc ;
-(void)funcShow ;

@end

@implementation VccAlete
-(void)setObject:(NSObject *)object{
    _object = object ;
    object.vcc = self ;
}
-(NSMutableDictionary<NSString *,handler> *)mutableDictionary{
    if (!_mutableDictionary) {
        _mutableDictionary = [[NSMutableDictionary alloc]init];
    }
    return _mutableDictionary ;
}
-(NSMutableArray *)mutableArray{
    if (!_mutableArray) {
        _mutableArray = [[NSMutableArray alloc]init];
    }
    return _mutableArray ;
}
-(VccAlete *(^)(NSString *, NSString *, NSInteger, handler))function{
    return ^VccAlete*(NSString *title,NSString *imgName,NSInteger index,handler handler){
        NSDictionary *dict = @{@"title":title,@"imageName":imgName,@"index":@(index)};
        [self.mutableArray addObject:dict];
        if (handler) {
            [self.mutableDictionary setObject:handler forKey:title];
        }
        return self ;
    };
}

-(VccAlete *(^)(NSString *))title{
    return ^VccAlete *(NSString *string){
        self.titleString = string ;
        return self ;
    };
}
-(VccAlete *(^)(NSString *, handler))action{
    return ^VccAlete*(NSString *title,handler handler){
        [self.mutableArray addObject:title];
        if (handler) {
            [self.mutableDictionary setObject:handler forKey:title];
        }
        return self ;
    };
}

-(void)show{
    if ([self.object respondsToSelector:@selector(funcShow)]) {
        [self.object funcShow];
    }else{
        [self.object show];
    }
}

@end



@implementation VCRFuncTool (function)
-(void)funcShow{
    /// 展示
    [[VCRFuncTool initAddFuncToolItems:self.vcc.mutableArray title:self.vcc.titleString delegate:self] show];
    /// 销毁关联
    [self.vcc.classObject dispose];
}

-(void)funcToolItem:(VCRFuncToolItem *)item AtIndex:(NSInteger)index{
    handler handler = [self.vcc.mutableDictionary objectForKey:item.itemName];
    if (handler) {
        handler(item.itemName);
    }
    self.vcc.object = nil ;
    self.vcc = nil ;
}
@end


@implementation VCRBrowerFuncShow (function)

-(void)funcShow{
    
    NSMutableArray *mutableArray = [[NSMutableArray alloc]init];
    [self.vcc.mutableArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        VCRBrowerModel *model = [[VCRBrowerModel alloc]init];
        model.title = [obj objectForKey:@"title"];
        model.index = [[obj objectForKey:@"index"] integerValue];
        model.imageName = [obj objectForKey:@"imageName"];
        [mutableArray addObject:model];
    }];
    dispatch_async(dispatch_get_main_queue(), ^{
        [[VCRBrowerFuncShow initWithBrower:mutableArray title:self.vcc.titleString delegate:self] show];
    });
    [self.vcc.classObject dispose];
}

-(void)initWithBrower:(VCRBrowerModel *)model andIndex:(NSInteger)index{
    
    handler handler = [self.vcc.mutableDictionary objectForKey:model.title];
    if (handler) {
        handler(model.title);
    }
    
}



@end
