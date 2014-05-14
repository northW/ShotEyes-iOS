//
//  CategoryTableViewCell.m
//  ShotEyesiPAD
//
//  Created by kita on 14-5-13.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import "CategoryTableViewCell.h"

@implementation CategoryTableViewCell

-(void)setDataWithCategory:(DACategory *)categroy
{
    self.categroy = categroy;
    self.lblName.text = categroy.name;
}

@end
