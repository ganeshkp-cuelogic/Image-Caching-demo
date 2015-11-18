//
//  CellImage.m
//  CachingImageDemo
//
//  Created by Tanveer on 18/11/15.
//  Copyright © 2015 Cuelogic. All rights reserved.
//

#import "CellImage.h"
#import "UIImageView+MyCache.h"
#import "Helpers.h"

@implementation CellImage

#pragma mark - Public Methods
-(void)configureCellForIndexPath:(NSIndexPath *)indexPath withImageURL:(NSString *)strImageUrl
{
    [self.lblImagename setText:[NSString stringWithFormat:@"Image Number %ld",indexPath.row]];
    
    //Now Check For Image downloading
    [self.imgViewDemo loadImageFromURL:[NSURL URLWithString:strImageUrl] withCachingKey:[NSString stringWithFormat:@"image%ld.jpg",indexPath.row] forImageView:self.imgViewDemo];
}

@end
