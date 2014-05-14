//
//  ReportListViewModel.m
//  ShotEyesiPAD
//
//  Created by kita on 14-5-13.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import "ReportListViewModel.h"


@implementation ReportListViewModel

- (id)init
{
    return [self initWithCategory:nil];
}

- (id)initWithCategory:(DACategory *)categroy
{
    self = [super init];
    
    self.category = categroy;
    self.modelClass = [DAReport class];
    self.APIPath = @"/Report/list";
    
    [[self getListWithParameters: categroy ? @{@"categroy": categroy._id}:nil] subscribeCompleted:^{
        
    }];
    
    return self;
}

@end
