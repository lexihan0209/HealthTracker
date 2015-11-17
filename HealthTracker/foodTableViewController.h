//
//  foodTableViewController.h
//  HealthTracker
//
//  Created by Xiqian Han on 4/27/15.
//  Copyright (c) 2015 Xiqian Han. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface foodTableViewController : UITableViewController
//@property (nonatomic,weak)IBOutlet UIButton *addFood;
@property(nonatomic)NSMutableArray *items;
-(void) addNewItem:(UIBarButtonItem *)sender;
//-(IBAction) addFoodAction:(id)sender;
@end
