//
//  Helpers.h
//  CachingImageDemo
//
//  Created by Tanveer on 18/11/15.
//  Copyright © 2015 Cuelogic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Helpers : NSObject
+(void)RunOnMainThread:(void (^)(void))block;
+(void)RunOnBackgroundThread:(void (^)(void))block;
+ (UIImage*)loadImageForKey:(NSString *)strName;
+ (void)saveImage:(UIImage*)image withName:(NSString *)strName;

@end
