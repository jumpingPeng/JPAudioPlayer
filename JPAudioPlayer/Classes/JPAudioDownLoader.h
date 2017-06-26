//
//  JPAudioDownLoader.h
//  播放器
//
//  Created by JUMPING on 2017/6/23.
//  Copyright © 2017年 JUMPING. All rights reserved.
//


#import <Foundation/Foundation.h>

@protocol JPAudioDownLoaderDelegate <NSObject>

- (void)downLoading;

@end


@interface JPAudioDownLoader : NSObject


@property (nonatomic, weak) id<JPAudioDownLoaderDelegate> delegate;

@property (nonatomic, assign) long long totalSize;
@property (nonatomic, assign) long long loadedSize;
@property (nonatomic, assign) long long offset;
@property (nonatomic, strong) NSString *mimeType;


- (void)downLoadWithURL:(NSURL *)url offset:(long long)offset;


@end
