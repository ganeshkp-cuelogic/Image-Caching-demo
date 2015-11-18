//
//  ImageDownloader.m
//  CachingImageDemo
//
//  Created by Tanveer on 18/11/15.
//  Copyright © 2015 Cuelogic. All rights reserved.
//

#import "ImageDownloader.h"
#import <UIKit/UIKit.h>

@implementation ImageDownloader
#pragma mark - Public Methods
+(void)downloadImageFromUrl:(NSURL *)urlImage withSuccess:(void(^)(id))successCompletionBlock withfailure:(void(^)(NSError *))failureCompletionBlock
{
    
    //Start Downloading the image
    NSURLSessionDownloadTask *downloadPhotoTask = [[NSURLSession sharedSession] downloadTaskWithURL:urlImage completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        if (error) {
            failureCompletionBlock(error);
        }else{
            UIImage *imgDownloaded = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
            successCompletionBlock(imgDownloaded);
        }
        
    }];
    
    [downloadPhotoTask resume];
}
@end
