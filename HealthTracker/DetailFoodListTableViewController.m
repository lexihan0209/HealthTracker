//
//  DetailFoodListTableViewController.m
//  HealthTracker
//
//  Created by Xiqian Han on 4/27/15.
//  Copyright (c) 2015 Xiqian Han. All rights reserved.
//

#import "DetailFoodListTableViewController.h"
#import "FoodItem.h"

@interface DetailFoodListTableViewController ()
@property (nonatomic, strong) NSMutableArray *foodItems;
@end

@implementation DetailFoodListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*self.foodItems = @[
                       [FoodItem foodItemWithName:@"Wheat Bagel(100g)" joules:245],
                       
                       [FoodItem foodItemWithName:@"Instant Coffee(1shoot)" joules:106],
                       [FoodItem foodItemWithName:@"Banana(100g)" joules:105],
                      
                       ,
                       [FoodItem foodItemWithName:@"Fruits Salad (1 cup)" joules:73.5],
                       [FoodItem foodItemWithName:@"Fried Sea Bass(1 fillet)" joules:241],
                       [FoodItem foodItemWithName:@"Chips(1oz)" joules:152],
                       [FoodItem foodItemWithName:@"Chicken Taco(100g)" joules:185]
                       ];*/

    self.navigationItem.title= @"Food DataBase";
    
    FoodItem *items1=[FoodItem foodItemWithName:@"Wheat Bagel(100g)" joules:245];
    FoodItem *items2=[FoodItem foodItemWithName:@"Orange(100g)" joules:45];
    FoodItem *items3=[FoodItem foodItemWithName:@"Instant Coffee(1shoot)" joules:106];
    FoodItem *items4=[FoodItem foodItemWithName:@"Banana(100g)" joules:105];
    FoodItem *items5=[FoodItem foodItemWithName:@"Cranberry Bagel(100g)" joules:270];
    FoodItem *items6=[FoodItem foodItemWithName:@"Oatmeal(1 cup)" joules:158];
    FoodItem *items7=[FoodItem foodItemWithName:@"Fruits Salad (1 cup)" joules:73.5];
    FoodItem *items8=[FoodItem foodItemWithName:@"Chips(1oz)" joules:152];
    FoodItem *items9=[FoodItem foodItemWithName:@"Fried Sea Bass(1 fillet)" joules:241];
    FoodItem *items10=[FoodItem foodItemWithName:@"Chicken Taco(100g)" joules:185];
    
    self.foodItems= @[items1,items2,items3,items4,items5,items6,items7,items8,items9,items10].mutableCopy;
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
    

}

-(void) addNewItem:(UIBarButtonItem *)sender{
    if (_foodSelect !=nil) {
        
       UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"Add new item" message:@"Add this item to your daily food list? " delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"add item", nil];
        alertView.alertViewStyle=UIAlertViewStyleDefault;
        [alertView show];
        
       //[self.ftvc.items addObject:_foodSelect];
    }
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex!=alertView.cancelButtonIndex) {

        
        [self.ftvc.items addObject:_foodSelect];
        
        // [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:numHomeItems-1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    _foodSelect = self.foodItems[selectedIndexPath.row];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
     return self.foodItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainCell"];
    }
    FoodItem *foodItem = self.foodItems[indexPath.row];
    NSString *joulename=[NSString stringWithFormat:@"%.0f", foodItem.joules];
    NSString *content=[foodItem.name stringByAppendingString:@", Calories: "];
    content=[content stringByAppendingString:joulename];
    content=[content stringByAppendingString:@"cal"];
    cell.textLabel.text= content;
    
    
    /*NSDictionary *item=self.foodItems[indexPath.row];
    if ([item[@"completed"]boolValue]) {
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
        
    }else{
        cell.accessoryType=UITableViewCellAccessoryNone;
        
    }*/
    
    
    return cell;
}

/*-(void) addNewItem:(UIBarButtonItem *)sender{
    
    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"New to-do item" message:@"Please enter the name of the new to-do item" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"add item", nil];
    alertView.alertViewStyle=UIAlertViewStylePlainTextInput;
    [alertView show];
    
}*/




/*-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSMutableDictionary *item= [self.foodItems[indexPath.row]mutableCopy];
    BOOL completed=[item[@"completed"]boolValue];
    item[@"completed"]=@(!completed);
    
    //self.items[index]=item;
    
    self.foodItems[indexPath.row]=item;
    
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType=([item[@"completed"]boolValue])? UITableViewCellAccessoryCheckmark:UITableViewCellAccessoryNone;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}*/



/*- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:@"DetailFoodListTableViewController "forIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    FoodItem *foodItem = self.foodItems[indexPath.row];
    
    cell.textLabel.text = foodItem.name;
    
   // NSEnergyFormatter *energyFormatter = [self energyFormatter];
    //cell.detailTextLabel.text = [energyFormatter stringFromJoules:foodItem.joules];
}*/

#pragma mark - Convenience

/*- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:AAPLFoodPickerViewControllerUnwindSegueIdentifier]) {
        NSIndexPath *indexPathForSelectedRow = self.tableView.indexPathForSelectedRow;
        
        self.selectedFoodItem = self.foodItems[indexPathForSelectedRow.row];
    }
}*/

/*- (NSEnergyFormatter *)energyFormatter {
    static NSEnergyFormatter *energyFormatter;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        energyFormatter = [[NSEnergyFormatter alloc] init];
        energyFormatter.unitStyle = NSFormattingUnitStyleLong;
        energyFormatter.forFoodEnergyUse = YES;
        energyFormatter.numberFormatter.maximumFractionDigits = 2;
    });
    
    return energyFormatter;
}*/


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
