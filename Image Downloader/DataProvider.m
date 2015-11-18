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

@implementation DataProvider
#pragma mark - Public Methods
+(void)getImagesFromURLs:(NSArray *)arrUrls withCompletionBlock:(void(^)(id))completionBlock
{
    NSMutableArray *arrImagesDownloaded = [[NSMutableArray alloc]init];
    
    __block  int count=1;
    for (NSURL *urlObject in arrUrls) {
        [Helpers RunOnBackgroundThread:^{
            [ImageDownloader downloadImageFromUrl:urlObject withSuccess:^(id imageObject) {
                count = count+1; // To Keep track of all images downloading ...
                [arrImagesDownloaded addObject:(UIImage *)imageObject];
                if (count==arrUrls.count-1) {
                    completionBlock(arrImagesDownloaded);
                    return ;
                }
            } withfailure:^(NSError *error) {
                count++;
            }];
        }];
    }
}
@end
