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
#import "APIUrl.h"

@interface CategroyAddViewModel()
@end

@implementation CategroyAddViewModel
@synthesize model=_model;

-(id)init
{
    self = [super init];
    _model = [[DACategory alloc] init];
    self.createAPIPath = kUrlCategoryAdd;

    return self;
}



@end
