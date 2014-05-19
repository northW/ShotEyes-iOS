//
//  CategoryListViewModel.m
//  ShotEyesiPAD
//
//  Created by kita on 14-5-13.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import "CategoryListViewModel.h"
#import <SmartSDK/RestHTTPRequestManager.h>
#import <SmartSDK/RestHelper.h>
#import <Underscore.h>
#import "Entities.h"

@interface CategoryListViewModel ()
@end



@implementation CategoryListViewModel



-(instancetype)init
{
    self = [super init];
    self.modelClass = [DACategory class];
    
    self.APIPath = @"/Category/list";
    
    [[self reloadSignal] subscribeCompleted:^{
        
    }];
    
    return self;
}


@end
