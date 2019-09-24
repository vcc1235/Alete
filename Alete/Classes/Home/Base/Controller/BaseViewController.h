//
//  BaseViewController.h
//  Common
//
//  Created by alete on 2019/3/21.
//  Copyright © 2019 aletevcc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController <__covariant ModelViewType>: UIViewController

@property (nonatomic, copy) NSString *backImageName ;
/// 导航栏字体颜色
@property (nonatomic, strong, nonnull) UIColor *navigationTintColor ;

@property (nonatomic, strong) ModelViewType <BaseViewModelDelegate> viewModel ;

-(Class)viewModelClass ;

/// 返回功能
-(void)popViewControllerAnimated:(BOOL)animatied ;

/// 更改导航栏背景色
-(void)setNavigationBarWithColor:(UIColor *)color ;

/**
 设置右侧导航栏
 @param title title
 @param image image
 */
-(void)setNavigationRightItemWithTitle:(NSString * __nullable)title image:(UIImage * __nullable)image ;
/**
 设置左侧导航栏
 @param title title description
 @param image image description
 */
-(void)setNavigationLeftItemWithTitle:(NSString * __nullable)title image:(UIImage * __nullable)image ;

/**
 右侧导航栏事件
 @param item item
 */
-(void)rightItemActionWithItem:(UIBarButtonItem *)item ;

/**
 左侧导航事件
 @param item item description
 */
-(void)leftItemActionWithItem:(UIBarButtonItem *)item ;
@end

NS_ASSUME_NONNULL_END
