//
//  ImagePickerManager.h
//  Common
//
//  Created by alete on 2019/4/8.
//  Copyright © 2019 aletevcc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^ImagePickerComplete)(UIImage *__nullable image , NSURL * __nullable url , NSError *__nullable error);
@interface ImagePickerManager : NSObject

@property (nonatomic, strong) UIColor *tintColor ;
@property (nonatomic, strong) UIColor *barTintColor ;
@property (nonatomic, strong) NSDictionary *titleTextAttributes ;

+(instancetype)shareInstanceManager ;
/// 图片编辑
-(ImagePickerManager *(^)(BOOL))isEditing ;

-(void)imagePickerSource:(UIImagePickerControllerSourceType)type controller:(UIViewController *__nonnull)controller complete:(ImagePickerComplete)complete ;

@end

NS_ASSUME_NONNULL_END
