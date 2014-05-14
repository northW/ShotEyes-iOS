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
@property RestHTTPRequestManager* requestManager;
@property BOOL isLogin;
@end

typedef id(^RACSignalErrorBlock)(NSError*);

@implementation CategoryListViewModel



-(instancetype)init
{
    self = [super init];
    if (self) {
        // init properties
        self.requestManager = [RestHTTPRequestManager sharedManager];
        self.start = 0;
        self.limit = 20;
        self.categories = [[NSArray alloc] init];
        self.isLogin = [RestHelper isLogin];
        
    }
    
    [[self getListWithParameters:nil] subscribeCompleted:^{
        
    }];
    
    return self;
}

- (RACSignalErrorBlock)errorBlock {
    //    @weakify(self);
    return ^(NSError* error) {
        //        @strongify(self);
        NSLog(@"%@",error);
        return [RACSignal empty];
    };
}


-(RACSignal *)getListWithParameters:(NSDictionary *)parameters
{
    if (parameters == nil) {
        parameters = [[NSDictionary alloc] init];
    }
    
    NSDictionary *params = Underscore.extend(parameters, @{ @"start": [NSNumber numberWithInt:self.start], @"limit": [NSNumber numberWithInt:self.limit] });
    
    RACSignal *sig = [[self.requestManager getPath:@"/Category/list" parameters:params] map:^id(id result) {
        
        NSDictionary *data =[result valueForKeyPath:@"data"];
        
        NSArray *array = [data valueForKey:@"items"];

        NSMutableArray *tmp = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dic in array) {
            DACategory *category = [[DACategory alloc] initWithDictionary:dic];
            
            [tmp addObject:category];
        }
        
        if (self.start == 0) {
            self.categories = [NSArray arrayWithArray:tmp];
        } else {
            self.categories = [self.categories arrayByAddingObjectsFromArray:tmp];
        }
        
        
        return result;
    }];
    
    if (self.isLogin) {
        return [sig catch:self.errorBlock];
    } else {
        RestHelper *helper = [RestHelper sharedInstance];
        return [[[[helper authorize] catch:self.errorBlock] concat:sig] catch:self.errorBlock];
    }
}

@end