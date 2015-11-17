
//  FoodItem.h
//  HealthTracker
//
//  Created by Xiqian Han on 4/27/15.
//  Copyright (c) 2015 Xiqian Han. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodItem : NSObject
// Creates a new food item.
+ (instancetype)foodItemWithName:(NSString *)name joules:(double)joules;

// \c AAPLFoodItem properties are immutable.
@property (nonatomic) NSString *name;
@property (nonatomic) double joules;
@end
