//
//  MyProfileViewController.h
//  HealthTracker
//
//  Created by Xiqian Han on 4/27/15.
//  Copyright (c) 2015 Xiqian Han. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "foodTableViewController.h"
#import "FoodItem.h"

@interface MyProfileViewController : UIViewController

@property(nonatomic)foodTableViewController *ftvcinp;

@property (nonatomic,weak)IBOutlet UILabel *settingAge;
@property (nonatomic,weak)IBOutlet UILabel *settingHeight;
@property (nonatomic,weak)IBOutlet UILabel *settingWeight;
@property (nonatomic,weak)IBOutlet UILabel *settingGender;
//@property (nonatomic,weak)IBOutlet UILabel *settingBMR;
//@property (nonatomic,weak)IBOutlet UILabel *settingDailyEnergy;

@property (nonatomic,weak)IBOutlet UITextField *settingAgeValue;
@property (nonatomic,weak)IBOutlet UITextField *settingHeightValue;
@property (nonatomic,weak)IBOutlet UITextField *settingWeightValue;
@property (nonatomic,weak)IBOutlet UITextField *settingGenderValue;


@property (nonatomic,weak)IBOutlet UILabel *settingBMRValue;
@property (nonatomic,weak)IBOutlet UILabel *settingDailyEnergyValue;
@property (nonatomic,weak)IBOutlet UIButton *gettingBMR;
@property (nonatomic,weak)IBOutlet  UIButton *gettingDailyEnergy;

@property (nonatomic)UIGestureRecognizer *tapper;

/*-(IBAction) inputAgeAction:(id)sender;
-(IBAction) inputHeightAction:(id)sender;
-(IBAction) inputWeightAction:(id)sender;
-(IBAction) inputGenderAction:(id)sender;*/
-(IBAction) getBMRAction:(id)sender;
-(IBAction) getDailyEnergyAction:(id)sender;
- (void)handleSingleTap:(UITapGestureRecognizer *) sender;
@end
