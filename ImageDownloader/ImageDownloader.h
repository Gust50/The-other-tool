//
//  ImageDownloader.h
//  LessonImageDownload
//
//  Created by y_小易 on 14-10-9.
//  Copyright (c) 2014年 lanou3g.com 蓝鸥科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ImageDownloader;

@protocol ImageDownloaderDelegate <NSObject>

@optional
//当图片下载完成后，代理执行该方法，参数downloadImage即下载得到的图像
- (void)imageDownloader:(ImageDownloader *)downloader didFinishedLoading:(UIImage *)downloadImage;

@end

@interface ImageDownloader : NSObject

@property (nonatomic,retain) NSString * imageUrl;
@property (nonatomic,assign) id<ImageDownloaderDelegate> delegate;

- (instancetype)initWithImageUrl:(NSString *)urlString delegate:(id<ImageDownloaderDelegate>)delegate;

//开始下载图片
- (void)startDownload;


@end
