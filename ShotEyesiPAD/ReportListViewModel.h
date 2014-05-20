//
//  ReportListViewModel.h
//  ShotEyesiPAD
//
//  Created by kita on 14-5-13.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SmartSDK/BaseListViewModel+TableDateSource.h>
#import "Entities.h"

@interface ReportListViewModel : BaseListViewModel
@property (retain, nonatomic) DACategory *category;
- (id)initWithCategory:(DACategory *)categroy cellIdentifier:(NSString *)cellIdentifier
    configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock;
@end
