//
//  ToDoListTableViewController.h
//  HealthTracker
//
//  Created by Xiqian Han on 4/28/15.
//  Copyright (c) 2015 Xiqian Han. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoListTableViewController : UITableViewController
-(void) addNewItem:(UIBarButtonItem *)sender;
-(void) toggleEditing:(UIBarButtonItem *)sender;
@end
