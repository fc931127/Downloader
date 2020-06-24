//
//  FCCommon.h
//  DownLoader
//
//  Created by suning on 2020/6/23.
//  Copyright © 2020 pptiyu. All rights reserved.
//

#ifndef FCCommon_h
#define FCCommon_h

typedef void (^FCProcessHandle)(float progress,NSString *sizeString,NSString *speedString);
typedef void (^FCDownloadCompletionHandle)(void);
typedef void (^FCFailureHandle)(NSError *error);

static NSString *const FCDownloadTaskDidFinishNotification   = @"FCDownloadTaskDidFinishNotification";
static NSString *const FCInsufficientSystemSpaceNotification = @"FCInsufficientSystemSpaceNotification";
static NSString *const FCProgressDidChangeNotificaiton       = @"FCProgressDidChangeNotificaiton";


static NSInteger kFCDwonloadMaxTaskCount = 2;

#endif /* FCCommon_h */
