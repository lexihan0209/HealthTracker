//
//  DetailFoodListTableViewController.h
//  HealthTracker
//
//  Created by Xiqian Han on 4/27/15.
//  Copyright (c) 2015 Xiqian Han. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodItem.h"
#import "foodTableViewController.h"

@interface DetailFoodListTableViewController : UITableViewController
@property (nonatomic, strong) FoodItem *foodSelect;
@property (nonatomic, strong) foodTableViewController *ftvc;
-(void) addNewItem:(UIBarButtonItem *)sender;
@end
