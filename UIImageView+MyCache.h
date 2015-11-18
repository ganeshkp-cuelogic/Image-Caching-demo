//
//  UIImageView+MyCache.h
//  CachingImageDemo
//
//  Created by Tanveer on 18/11/15.
//  Copyright © 2015 Cuelogic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (MyCache)



@property (nonatomic,copy) NSString *strUrl;

-(void)loadImageFromURL:(NSURL*)url withCachingKey:(NSString*)key forImageView:(UIImageView *)imgView;

@end
