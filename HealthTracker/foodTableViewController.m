//
//  foodTableViewController.m
//  HealthTracker
//
//  Created by Xiqian Han on 4/27/15.
//  Copyright (c) 2015 Xiqian Han. All rights reserved.
//

#import "foodTableViewController.h"
#import "DetailFoodListTableViewController.h"
#import "FoodItem.h"

@interface foodTableViewController ()

@end

@implementation foodTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
        //set the tab bar item's title
        self.tabBarItem.title=@"Food List";
        
        UIImage *i=[UIImage imageNamed:@"icon_food@2x.png"];
        
        self.tabBarItem.image = [i imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];

    FoodItem *items1=[FoodItem foodItemWithName:@"Wheat Bagel(100g)" joules:245];
    
    self.items= @[items1].mutableCopy;
    self.navigationItem.title= @"Food List";
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];


    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(toggleEditing:)];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.items.count;
}

-(void) addNewItem:(UIBarButtonItem *)sender{
 
 
 NSBundle *appBundle = [NSBundle mainBundle];
 
 
 //Create a DetailFoodListTableViewController
 
 DetailFoodListTableViewController *detail = [[DetailFoodListTableViewController alloc]initWithNibName:@"DetailFoodListTableViewController" bundle:appBundle];
 
 //Puhs it onto the top of the navigation controller's stack
 [self.navigationController pushViewController:detail animated:YES];
    detail.ftvc=self;
 
 }


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainCell"];
    }
    
    //NSDictionary *item=self.items[indexPath.row];
  
    FoodItem *foodItem = self.items[indexPath.row];
    NSString *joulename=[NSString stringWithFormat:@"%.0f", foodItem.joules];
    NSString *content=[foodItem.name stringByAppendingString:@", Calories: "];
    content=[content stringByAppendingString:joulename];
    content=[content stringByAppendingString:@"cal"];
    cell.textLabel.text= content;
    
    return cell;
}


-(UITableViewCellEditingStyle)tableView:(UITableView*)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewCellEditingStyleDelete;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
    
}

-(void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [self.items removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
    
    
}

-(void) toggleEditing:(UIBarButtonItem *)sender{
    
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    
    if (self.tableView.editing) {
        sender.title=@"Done";
        sender.style=UIBarButtonItemStyleDone;
    }else{
        sender.title=@"Edit";
        sender.style=UIBarButtonItemStylePlain;
        
        
    }
    
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
