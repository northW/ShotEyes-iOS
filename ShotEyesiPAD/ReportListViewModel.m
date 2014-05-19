//
//  ReportListViewModel.m
//  ShotEyesiPAD
//
//  Created by kita on 14-5-13.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import "ReportListViewModel.h"


@implementation ReportListViewModel


- (id)initWithCategory:(DACategory *)categroy cellIdentifier:(NSString *)cellIdentifier
    configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock
{
    self.category = categroy;
    self.listCondition = categroy ? @{@"categroy": categroy._id}:nil;
    self = [super initWithViewModelClass:[DAReport class] APIPath:@"/Report/list" cellIdentifier:cellIdentifier configureCellBlock:configureCellBlock];
    
    return self;
}


@end
