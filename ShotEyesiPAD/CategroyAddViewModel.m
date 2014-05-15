//
//  CategroyAddViewModel.m
//  ShotEyesiPAD
//
//  Created by kita on 14-5-14.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import "CategroyAddViewModel.h"
#import <SmartSDK/RestHTTPRequestManager.h>
#import <SmartSDK/RestHelper.h>
#import <Underscore.h>

@interface CategroyAddViewModel()
@end

@implementation CategroyAddViewModel


-(id)init
{
    self = [super init];
    self.model = [[DACategory alloc] init];
    
    return self;
}


-(RACSignal *)postData
{

    self.APIPath = @"/Category/add";
    return [super postData];
}


@end
