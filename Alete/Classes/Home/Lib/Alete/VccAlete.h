//
//  VccAlete.h
//  AFNetworking
//
//  Created by alete on 2019/8/8.
//

#import <Foundation/Foundation.h>


@class VCRFuncTool ;
typedef void(^handler)(id item);
@interface VccAlete <ClassType,ValueType> : NSObject

@property (nonatomic, strong) VccAlete<ClassType,ValueType>*(^title)(NSString *) ;

@property (nonatomic, strong) VccAlete <ClassType,ValueType>*(^function)(NSString *title,NSString *imageName,NSInteger index,handler handler) ;

@property (nonatomic, strong) ValueType object ;

@property (nonatomic, strong) VccAlete<ClassType,ValueType> *(^action)(NSString *title, handler handler) ;

@property (nonatomic, strong) ClassType classObject ;

-(void)show ;

@end



