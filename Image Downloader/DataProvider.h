//
//  DataProvider.h
//  CachingImageDemo
//
//  Created by Tanveer on 18/11/15.
//  Copyright © 2015 Cuelogic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataProvider : NSObject

#pragma mark - Public Methods
+(void)getImagesFromURLs:(NSArray *)arrUrls withCompletionBlock:(void(^)(id))completionBlock;


@end
