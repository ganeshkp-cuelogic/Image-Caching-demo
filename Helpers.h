//
//  Helpers.h
//  CachingImageDemo
//
//  Created by Tanveer on 18/11/15.
//  Copyright © 2015 Cuelogic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Helpers : NSObject
+(void)RunOnMainThread:(void (^)(void))block;
+(void)RunOnBackgroundThread:(void (^)(void))block;

@end
