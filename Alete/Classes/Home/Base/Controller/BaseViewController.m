//
//  BaseViewController.m
//  Common
//
//  Created by alete on 2019/3/21.
//  Copyright © 2019 aletevcc. All rights reserved.
//

#import "BaseViewController.h"
#import "UIImage+Alete.h"
@interface BaseViewController ()

@end

@implementation BaseViewController
-(Class)viewModelClass{
    return BaseViewModel.class ;
}
-(id)viewModel{
    if (!_viewModel) {
        _viewModel = [[self.viewModelClass alloc]init];
    }
    return _viewModel ;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = true ;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    [self initNavigationBar];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    /// 更新状态栏
    [self setNeedsStatusBarAppearanceUpdate];
    if (@available(iOS 11.0, *)) {
        [self setNeedsUpdateOfHomeIndicatorAutoHidden];
    } else {
        // Fallback on earlier versions
    }

}
-(BOOL)prefersStatusBarHidden{
    return false ;
}
-(BOOL)prefersHomeIndicatorAutoHidden{
    return true ;
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent ;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:true];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


#pragma mark - UINavigationController -
/// 设置右侧导航栏
-(void)setNavigationRightItemWithTitle:(NSString *)title image:(UIImage *)image{
    UIBarButtonItem *rightItem ;
    if (title != nil) {
        rightItem = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(rightItemActionWithItem:)];
    }else{
        rightItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(rightItemActionWithItem:)];
    }
    self.navigationItem.rightBarButtonItem = rightItem ;
    
}
-(void)setNavigationLeftItemWithTitle:(NSString *)title image:(UIImage *)image{
    UIBarButtonItem *rightItem ;
    if (title != nil) {
        rightItem = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(leftItemActionWithItem:)];
    }else{
        rightItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(leftItemActionWithItem:)];
    }
    self.navigationItem.leftBarButtonItem = rightItem ;
}
-(void)leftItemActionWithItem:(UIBarButtonItem *)item{
    
}
-(void)rightItemActionWithItem:(UIBarButtonItem *)item{
    
}

- (void)initNavigationBar
{
    if (self.navigationController != nil)
    {
        // set back button for leftBarButtonItem
        if (self.navigationController.viewControllers.firstObject == self) {
            self.navigationItem.leftBarButtonItem = nil;
        }
        else {
            UIBarButtonItem * leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:self.backImageName] style:UIBarButtonItemStylePlain target:self action:@selector(backNaviationControllerAction:)];
            self.navigationItem.leftBarButtonItems = @[leftBarButtonItem];
        }
    }
}
-(void)backNaviationControllerAction:(UIBarButtonItem *)item{
    if (self.navigationController != nil) {
        [self.navigationController popViewControllerAnimated:true];
    }
}

-(void)setNavigationBarWithColor:(UIColor *)color{
    self.navigationController.navigationBar.translucent = false ;
    self.navigationController.navigationBar.clipsToBounds = false ;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage al_imageWithColor:color] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barTintColor = color ;
    [self.navigationController.navigationBar setBackgroundColor:color];
}
/// 导航栏字体颜色
-(void)setNavigationTintColor:(UIColor *)navigationTintColor{
    self.navigationController.navigationBar.tintColor = navigationTintColor ;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:navigationTintColor};
}

/// 返回键
-(void)popViewControllerAnimated:(BOOL)animatied{
    
    if (self.navigationController == nil) {
        if ([self respondsToSelector:@selector(dismissViewControllerAnimated:completion:)]) {
            [self dismissViewControllerAnimated:animatied completion:nil];
        }
        return ;
    }
    if (self.navigationController.viewControllers.count == 1) {
        if ([self.navigationController respondsToSelector:@selector(dismissViewControllerAnimated:completion:)]) {
            [self.navigationController dismissViewControllerAnimated:animatied completion:nil];
        }
    }else{
        [self.navigationController popViewControllerAnimated:animatied];
    }
    
}

-(BOOL)enableScrollWhenPlaceHolderViewShowing{
    return false ;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
