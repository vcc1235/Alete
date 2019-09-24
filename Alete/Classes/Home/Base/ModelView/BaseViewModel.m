//
//  BaseViewModel.m
//  Common
//
//  Created by alete on 2019/4/8.
//  Copyright © 2019 aletevcc. All rights reserved.
//

#import "BaseViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface BaseViewModel  ()
@property (nonatomic, strong) NSMutableDictionary *commandS ;
@end

@implementation BaseViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.commandS = [NSMutableDictionary dictionary];
    }
    return self;
}
-(RACCommand *)requestCommandWithAction:(NSString *)action{
    RACCommand <NSDictionary *,id<BaseModelDelegate>>*command = [self.commandS objectForKey:action];
    if (command == nil) {
        command = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                if ([self respondsToSelector:@selector(excutionRequestWithSubscribe:action:andInput:)]) {
                    return [self excutionRequestWithSubscribe:subscriber action:action andInput:input];
                }else{
                    return nil ;
                }
            }];
        }];
        [self.commandS setObject:command forKey:action];
    }
    return command ;
}
-(RACCommand * _Nonnull (^)(NSString * _Nonnull))requestCommand{
    return ^RACCommand*(NSString *action){
        return [self requestCommandWithAction:action];
    };
}

-(void (^)(NSString *))createSignalNext:(void (^)(id))next{
    return [self createSignalNext:next Error:nil complete:nil];
}
-(void (^)(NSString *))createSignalNext:(void (^)(id))next Error:(void (^)(NSError *))error{
    return [self createSignalNext:next Error:error complete:nil];
}
-(void (^)(NSString *))createSignalNext:(void (^)(id))next Error:(void (^)(NSError *))error complete:(void (^)(void))complete{
    return ^(NSString *action){
        [self.requestCommand(action).executionSignals subscribeNext:^(RACSignal * _Nullable x) {
            if (error == nil) {
                [x subscribeNext:next];
            }else if (complete == nil){
                [x subscribeNext:next error:error];
            }else{
                [x subscribeNext:next error:error completed:complete];
            }
        }];
    };
}

@end
