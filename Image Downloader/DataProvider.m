//
//  DataProvider.m
//  CachingImageDemo
//
//  Created by Tanveer on 18/11/15.
//  Copyright © 2015 Cuelogic. All rights reserved.
//

#import "DataProvider.h"
#import "ImageDownloader.h"
#import "Helpers.h"
#import <UIKit/UIKit.h>
#import "NSString+MD5.h"

//
//

@implementation DataProvider
#pragma mark - Public Methods
+(void)getImagesFromURLs:(NSArray *)arrUrls withCompletionBlock:(void(^)(id))completionBlock
{
    NSMutableArray *arrImagesDownloaded = [[NSMutableArray alloc]init];
    
    __block  int count=0;
    for (NSURL *urlObject in arrUrls) {
        
        [Helpers RunOnBackgroundThread:^{
            //Check If exists or not in     cache
            if ([Helpers loadImageForKey:[urlObject.absoluteString MD5String]]) {
                count = count+1; // To Keep track of all images downloading ...
                [arrImagesDownloaded addObject:[Helpers loadImageForKey:[urlObject.absoluteString MD5String]]];
                if (count==arrUrls.count) {
                    completionBlock(arrImagesDownloaded);
                    return ;
                }
            }else{
                [ImageDownloader downloadImageFromUrl:urlObject withSuccess:^(id imageObject) {
                    count = count+1; // To Keep track of all images downloading ...
                    [arrImagesDownloaded addObject:(UIImage *)imageObject];
                    [Helpers saveImage:imageObject withName:[urlObject.absoluteString MD5String]];
                    if (count==arrUrls.count) {
                        completionBlock(arrImagesDownloaded);
                        return ;
                    }
                } withfailure:^(NSError *error) {
                    count++;
                }];
            }
        }];
    }
}
@end
