//
//  CategoryListViewModel.h
//  ShotEyesiPAD
//
//  Created by kita on 14-5-13.
//  Copyright (c) 2014年 kita. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryListViewModel : NSObject
@property NSArray *categories;
@property int start;
@property int limit;
-(RACSignal *)getListWithParameters:(NSDictionary *)parameters;
@end
