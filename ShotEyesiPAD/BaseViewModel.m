//
//  BaseViewModel.m
//  ShotEyesiPAD
//
//  Created by kita on 14-5-14.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import "BaseViewModel.h"
#import "Jastor.h"
#import <SmartSDK/RestHTTPRequestManager.h>
#import <SmartSDK/RestHelper.h>

@interface BaseViewModel ()
@property RestHTTPRequestManager* requestManager;

@end

typedef id(^RACSignalErrorBlock)(NSError*);

@implementation BaseViewModel
-(id)init
{
    self = [super init];
    
    return [self initWithModel:[[[self.model class] alloc] init]];
}

-(id)initWithModel:(id)model
{
    self = [super init];
    self.model = model;
    self.requestManager = [RestHTTPRequestManager sharedManager];
    
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

-(RACSignal *)createSignal
{
    NSDictionary *params = [(Jastor *)self.model toDictionary];
    
    RACSignal * sig = [[self.requestManager postPath:self.createAPIPath parameters:params] map:^id(id result) {
        NSDictionary *data =[result valueForKeyPath:@"data"];
        
        self.model = [[[self.model class] alloc] initWithDictionary:data];
        
        return result;
    }];
    
    return [sig catch:self.errorBlock];
}

-(RACSignal *)updateSignal
{
    NSDictionary *params = [(Jastor *)self.model toDictionary];
    
    RACSignal * sig = [[self.requestManager postPath:self.updateAPIPath parameters:params] map:^id(id result) {
        NSDictionary *data =[result valueForKeyPath:@"data"];
        
        self.model = [[[self.model class] alloc] initWithDictionary:data];
        
        return result;
    }];
    
    return [sig catch:self.errorBlock];
}

-(RACSignal *)fetchSignal
{
    RACSignal * sig = [[self.requestManager getPath:self.fetchAPIPath parameters:self.fetchCondition] map:^id(id result) {
        NSDictionary *data =[result valueForKeyPath:@"data"];
        
        self.model = [[[self.model class] alloc] initWithDictionary:data];
        
        return result;
    }];
    
    return [sig catch:self.errorBlock];
}

@end
