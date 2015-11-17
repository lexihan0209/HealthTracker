//
//  MyProfileViewController.m
//  HealthTracker
//
//  Created by Xiqian Han on 4/27/15.
//  Copyright (c) 2015 Xiqian Han. All rights reserved.
//

#import "MyProfileViewController.h"

@interface MyProfileViewController ()

@property (nonatomic)NSString *age;
@property (nonatomic)NSString *height;
@property (nonatomic)NSString *weight;
@property (nonatomic)NSString *gender;
@property (nonatomic)NSString *dailyEnegy;
@property (nonatomic)NSString *bmr;



@end

@implementation MyProfileViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
        //set the tab bar item's title
        self.tabBarItem.title=@"MyProfile";
        
        UIImage *i=[UIImage imageNamed:@"icon_profile@2x.png"];
        
        self.tabBarItem.image = [i imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        
    }
    return self;
}
- (BOOL) canBecomeFirstResponder
{
    // Speify that the view controller will receive events
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    _tapper = [[UITapGestureRecognizer alloc]
              initWithTarget:self action:@selector(handleSingleTap:)];
    _tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:_tapper];
}

- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) getBMRAction:(id)sender{
    /*double ageDouble=[_age doubleValue];
    double heightDouble=[_height doubleValue];
    double weightDouble=[_weight doubleValue];*/
    
    double ageDouble=[_settingAgeValue.text doubleValue];
    double heightDouble=[_settingHeightValue.text doubleValue];
    double weightDouble=[_settingWeightValue.text doubleValue];
    NSString *str1=@"M";
    NSString *str2=@"F";
    
    if([_settingGenderValue.text isEqualToString:str1]){
        double bmrDboule=13.7*weightDouble+5.0*heightDouble-6.8*ageDouble+66;
        _bmr=[NSString stringWithFormat:@"%.2f", bmrDboule];
        _settingBMRValue.text=_bmr;
    }
    else if([_settingGenderValue.text  isEqualToString:str2]){

        double bmrDboule=9.6*weightDouble+1.8*heightDouble-4.7*ageDouble+655;
        _bmr=[NSString stringWithFormat:@"%.2f", bmrDboule];
        _settingBMRValue.text=_bmr;
    
    
    }
}
-(IBAction) getDailyEnergyAction:(id)sender{
    double total=0;
    for (FoodItem *item in _ftvcinp.items)
    {
        total=item.joules+total;
        
    }
    
    _bmr=[NSString stringWithFormat:@"%.2f", total];
    _settingDailyEnergyValue.text=_bmr;

}




@end
