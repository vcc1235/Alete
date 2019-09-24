//
//  AleteApiManager.h
//  Alete_Example
//
//  Created by alete on 2019/7/16.
//  Copyright © 2019 1041497818@qq.com. All rights reserved.
//

#import <Alete/VCApiManager.h>

NS_ASSUME_NONNULL_BEGIN



@interface UserApi : NSObject

@property (nonatomic, strong) NSString *login ;

@end


@interface AleteApiManager : VCApiManager

@property (nonatomic, strong) UserApi *userApi ;

@end

NS_ASSUME_NONNULL_END
