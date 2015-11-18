//
//  UIImageView+MyCache.m
//  CachingImageDemo
//
//  Created by Tanveer on 18/11/15.
//  Copyright © 2015 Cuelogic. All rights reserved.
//

#import "UIImageView+MyCache.h"
#import "Helpers.h"
#import <objc/runtime.h>

@implementation UIImageView (MyCache)
@dynamic strUrl;


static char kUrlKey;

-(void)loadImageFromURL:(NSURL*)url withCachingKey:(NSString*)key forImageView:(UIImageView *)imgView
{
    self.strUrl = url.absoluteString;
    
    if([self loadImageForKey:key]==nil)
    {
        [Helpers RunOnBackgroundThread:^{
            
            NSData *data = [NSData dataWithContentsOfURL:url];
            UIImage *imageFromData = [UIImage imageWithData:data];
            
            [Helpers RunOnMainThread:^{
                
                if ([self.strUrl isEqualToString:url.absoluteString]) {
                    self.image = imageFromData;
                    [self saveImage:self.image withName:key];
                }
                self.strUrl=nil;
            }];
            
        }];
    }
    else
    {
        [Helpers RunOnMainThread:^{
            self.image = [self loadImageForKey:key];
            self.strUrl=nil;
        }];
    }
}

- (void)setStrUrl:(id)object {
    objc_setAssociatedObject(self, @selector(strUrl), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)strUrl {
    return objc_getAssociatedObject(self, @selector(strUrl));
}






- (void)saveImage:(UIImage*)image withName:(NSString *)strName
{
    if (image != nil)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString* path = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",strName]];
        
        NSLog(@"Saving Image path is %@ ",path);
        
        NSData* data = UIImagePNGRepresentation(image);
        [data writeToFile:path atomically:YES];
    }
}
- (UIImage*)loadImageForKey:(NSString *)strName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString* path = [documentsDirectory stringByAppendingPathComponent:
                      strName];
    UIImage* image = [UIImage imageWithContentsOfFile:path];
    return image;
}
@end
