//
//  FoodItem.m
//  HealthTracker
//
//  Created by Xiqian Han on 4/27/15.
//  Copyright (c) 2015 Xiqian Han. All rights reserved.
//

#import "FoodItem.h"

@implementation FoodItem
+ (instancetype)foodItemWithName:(NSString *)name joules:(double)joules {
    FoodItem *foodItem = [[self alloc] init];
    
    foodItem.name = name;
    foodItem.joules = joules;
    
    return foodItem;
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[FoodItem class]]) {
        return [object joules] == self.joules && [self.name isEqualToString:[object name]];
    }
    
    return NO;
}

- (NSString *)description {
    return [@{
              @"name": self.name,
              @"joules": @(self.joules)
              } description];
}

@end
