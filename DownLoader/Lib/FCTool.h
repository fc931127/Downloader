//
//  FCTool.h
//  DownLoader
//
//  Created by suning on 2020/6/23.
//  Copyright © 2020 pptiyu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FCTool : NSObject
/**将文件大小(bytes)转换成string*/
+ (NSString *)convertSize:(long long)length;
@end

NS_ASSUME_NONNULL_END
