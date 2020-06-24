//
//  FCTool.m
//  DownLoader
//
//  Created by suning on 2020/6/23.
//  Copyright © 2020 pptiyu. All rights reserved.
//

#import "FCTool.h"

@implementation FCTool
+ (NSString *)convertSize:(long long)length {
    if(length<1024) {
        return [NSString stringWithFormat:@"%lldB",length];
    }else if(length>=1024&&length<1024*1024) {
        return [NSString stringWithFormat:@"%.0fK",(float)length/1024];
    }else if(length >=1024*1024&&length<1024*1024*1024) {
        return [NSString stringWithFormat:@"%.1fM",(float)length/(1024*1024)];
    }else {
        return [NSString stringWithFormat:@"%.1fG",(float)length/(1024*1024*1024)];
    }
}
@end
