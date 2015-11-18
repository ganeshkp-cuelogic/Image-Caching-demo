//
//  ImageDownloader.h
//  CachingImageDemo
//
//  Created by Tanveer on 18/11/15.
//  Copyright © 2015 Cuelogic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageDownloader : NSObject


#pragma mark - Public Methods
+(void)downloadImageFromUrl:(NSURL *)urlImage withSuccess:(void(^)(id))successCompletionBlock withfailure:(void(^)(NSError *))failureCompletionBlock;
@end
