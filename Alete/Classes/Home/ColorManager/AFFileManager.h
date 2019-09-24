//
//  AFFileManager.h
//  Common
//
//  Created by alete on 2019/3/22.
//  Copyright © 2019 aletevcc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AFFileManager : NSObject

/// (Bundle.main)获取文件数据 转为 Dictionary Array
+(id)getLocalJsonDataByType:(NSString *)fileName ;

+(NSString *)createFileWithData:(NSData *)data ;

/// 持久化保存
+(void)saveContentWithId:(id)conent key:(NSString *)key;
/// 获取
+(id)obtainContentWithKey:(NSString *)key ;

/// 文件大小
+(long long) fileSizeAtPath:(NSString*) filePath ;

@end

NS_ASSUME_NONNULL_END
