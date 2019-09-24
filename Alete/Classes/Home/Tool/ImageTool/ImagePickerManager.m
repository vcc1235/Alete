//
//  ImagePickerManager.m
//  Common
//
//  Created by alete on 2019/4/8.
//  Copyright © 2019 aletevcc. All rights reserved.
//

#import "ImagePickerManager.h"
#import <CoreServices/CoreServices.h>

@interface ImagePickerViewController : UIImagePickerController

@end

@implementation ImagePickerViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
}
-(UIViewController *)childViewControllerForStatusBarStyle{
    return self.visibleViewController ;
}
-(UIViewController *)childViewControllerForStatusBarHidden{
    return self.visibleViewController ;
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault ;
}
@end


@interface ImagePickerManager () <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) ImagePickerViewController *imagePickerController ;
@property (nonatomic, strong) ImagePickerComplete complete ;
@property (nonatomic, strong) UIViewController *viewController ;
@property (nonatomic, assign) BOOL isEdt ;
@end

@implementation ImagePickerManager
-(ImagePickerManager *(^)(BOOL))isEditing{
    return ^ImagePickerManager*(BOOL isEd){
        self.isEdt = isEd ;
        return  self ;
    };
}
+(instancetype)shareInstanceManager{
    static ImagePickerManager *__imageInstanceManager ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __imageInstanceManager = [[ImagePickerManager alloc]init];
        __imageInstanceManager.isEdt = true ;
    });
    return __imageInstanceManager ;
}
- (ImagePickerViewController *)imagePickerController
{
    if (!_imagePickerController)
    {
        _imagePickerController = [[ImagePickerViewController alloc]init];
        _imagePickerController.delegate = self;
        _imagePickerController.allowsEditing = self.isEdt;
        _imagePickerController.navigationBar.tintColor = self.tintColor ;
        _imagePickerController.navigationBar.barTintColor = self.barTintColor ;
        _imagePickerController.navigationBar.titleTextAttributes = self.titleTextAttributes ;
        _imagePickerController.modalPresentationStyle = UIModalPresentationCustom;
    }
    return _imagePickerController;
}
-(void)imagePickerSource:(UIImagePickerControllerSourceType)type controller:(UIViewController *)controller complete:(nonnull ImagePickerComplete)complete{
    
    if (![UIImagePickerController isSourceTypeAvailable:type]) {
        if (complete) {
            if (type == UIImagePickerControllerSourceTypeCamera) {
                complete(nil,nil,[NSError errorWithDomain:NSOSStatusErrorDomain code:-1 userInfo:@{NSLocalizedDescriptionKey:@"相机调用失败"}]);
            }else{
                complete(nil,nil,[NSError errorWithDomain:NSOSStatusErrorDomain code:-1 userInfo:@{NSLocalizedDescriptionKey:@"调用相册失败"}]);
            }
        }
        return ;
    }
    self.imagePickerController.sourceType = type ;
    if (type == UIImagePickerControllerSourceTypeSavedPhotosAlbum) {
        self.imagePickerController.mediaTypes = [NSArray arrayWithObjects:(NSString *)kUTTypeMovie,(NSString *)kUTTypeImage,nil];
    }
  
    self.complete = complete ;
    self.viewController = controller ;
    [controller presentViewController:self.imagePickerController animated:true completion:^{
        
    }];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    //取得照片
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    NSURL *url ;
    UIImage *image ;
    if ([mediaType isEqualToString:(NSString *)kUTTypeMovie]) {
        url = info[UIImagePickerControllerMediaURL];
    }else if ([mediaType isEqualToString:(NSString *)kUTTypeImage]){
        if (self.isEdt == false) {
            image = info[UIImagePickerControllerOriginalImage];
            if(image.imageOrientation != UIImageOrientationUp){
                // Adjust picture Angle
                UIGraphicsBeginImageContext(image.size);
                [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
                image = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
            }
        }else{
            image = info[UIImagePickerControllerEditedImage];
        }
    }
    if (image && self.complete) {
        self.complete(image, nil, nil) ;
    }else if(url && self.complete){
        self.complete(nil,url,nil);
    }else{
        self.complete(nil,nil,[NSError errorWithDomain:NSOSStatusErrorDomain code:-1 userInfo:@{NSLocalizedDescriptionKey:NSLocalizedString(@"获取图片失败", nil)}]);
    }
    _imagePickerController = nil ;
    self.isEdt = true ;
    [self.viewController dismissViewControllerAnimated:true completion:nil];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self.viewController dismissViewControllerAnimated:true completion:nil];
}
@end
