//
//  BaseNavigationController.m
//  AFNetworking
//
//  Created by alete on 2019/7/17.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController () < UINavigationControllerDelegate,UIGestureRecognizerDelegate >

@end
@implementation BaseNavigationController
-(instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        self.navigationBar.translucent = false ;
        self.navigationBar.clipsToBounds = false ;
    }
    return self ;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configGesture];
    
}

/**
 * config gesture delegate
 */
- (void)configGesture {
    __weak BaseNavigationController * weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate = weakSelf;
    }
}
/**
 * rewrite push method
 * hijack the push method to disable the gesture
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    [super pushViewController:viewController animated:animated];
}
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //
    //    if ([navigationController.viewControllers count]>=2) {
    //        self.leftTitleLabel.hidden = YES ;
    //        self.navigationBar.height = kNavigationBarHeight-kStatusBarHeight ;
    //    }else{
    //        self.leftTitleLabel.hidden = NO ;
    //    }
    
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}


- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated {
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)] && animated == YES) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    return  [super popToRootViewControllerAnimated:animated];
}

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    return [super popToViewController:viewController animated:animated];
}


-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        
        if (self.viewControllers.count < 2 || self.visibleViewController == [self.viewControllers objectAtIndex:0]) {
            return NO;
        }
    }
    
    return YES;
}

-(UIViewController *)childViewControllerForStatusBarStyle{
    return self.visibleViewController ;
}
-(UIViewController *)childViewControllerForStatusBarHidden{
    return self.visibleViewController ;
}
@end
