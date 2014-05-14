//
//  CategoryTableViewCell.h
//  ShotEyesiPAD
//
//  Created by kita on 14-5-13.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entities.h"


@interface CategoryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) DACategory *categroy;

-(void)setDataWithCategory:(DACategory *)categroy;
@end
