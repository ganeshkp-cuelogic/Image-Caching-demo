//
//  CellImage.h
//  CachingImageDemo
//
//  Created by Tanveer on 18/11/15.
//  Copyright © 2015 Cuelogic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellImage : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgViewDemo;
@property (weak, nonatomic) IBOutlet UILabel *lblImagename;


#pragma mark - Public Methods
-(void)configureCellForIndexPath:(NSIndexPath *)indexPath withImage:(UIImage *)imageObject;
@end
