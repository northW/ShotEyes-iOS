//
//  BaseViewModel.h
//  ShotEyesiPAD
//
//  Created by kita on 14-5-14.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseViewModel : NSObject
@property (retain, nonatomic) id model;
@property (retain, nonatomic) NSString *createAPIPath;
@property (retain, nonatomic) NSString *updateAPIPath;
@property (retain, nonatomic) NSString *fetchAPIPath;
@property (retain, nonatomic) NSDictionary *fetchCondition;
-(RACSignal *)createSignal;
-(RACSignal *)updateSignal;
-(RACSignal *)fetchSignal;
@end
