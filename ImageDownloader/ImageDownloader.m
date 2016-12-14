//
//  ImageDownloader.m
//  LessonImageDownload
//
//  Created by y_小易 on 14-10-9.
//  Copyright (c) 2014年 lanou3g.com 蓝鸥科技. All rights reserved.
//

#import "ImageDownloader.h"

@implementation ImageDownloader

- (void)dealloc
{
    self.imageUrl = nil;
    [super dealloc];
}

- (instancetype)initWithImageUrl:(NSString *)urlString delegate:(id<ImageDownloaderDelegate>)delegate
{
    self = [super init];
    if (self) {
        
        //存储下载的图片网址
        self.imageUrl = urlString;
        //设置代理
        self.delegate = delegate;
    }
    
    return self;
}

//开始下载图片
- (void)startDownload
{
    NSURL * url = [NSURL URLWithString:self.imageUrl];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
       
        UIImage * image = [UIImage imageWithData:data];
        
        //通过代理将image传出
        if ([_delegate respondsToSelector:@selector(imageDownloader:didFinishedLoading:)]) {
            
            [_delegate imageDownloader:self didFinishedLoading:image];
        }
        
        
    }];
}

@end
