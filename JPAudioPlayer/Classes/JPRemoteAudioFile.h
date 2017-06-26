//
//  JPRemoteAudioFile.h
//  播放器
//
//  Created by JUMPING on 2017/6/23.
//  Copyright © 2017年 JUMPING. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface JPRemoteAudioFile : NSObject


/**
 根据url, 获取相应的本地, 缓存路径, 下载完成的路径
 */
+ (NSString *)cacheFilePath:(NSURL *)url;
+ (long long)cacheFileSize:(NSURL *)url;
+ (BOOL)cacheFileExists:(NSURL *)url;


+ (NSString *)tmpFilePath:(NSURL *)url;
+ (long long)tmpFileSize:(NSURL *)url;
+ (BOOL)tmpFileExists:(NSURL *)url;
+ (void)clearTmpFile:(NSURL *)url;


+ (NSString *)contentType:(NSURL *)url;

+ (void)moveTmpPathToCachePath:(NSURL *)url;



@end
