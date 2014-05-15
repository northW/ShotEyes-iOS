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
@property (retain, nonatomic) NSString *APIPath;
-(RACSignal *)postData;
@end
