//
//  ToDoListTableViewController.m
//  HealthTracker
//
//  Created by Xiqian Han on 4/28/15.
//  Copyright (c) 2015 Xiqian Han. All rights reserved.
//

#import "ToDoListTableViewController.h"

@interface ToDoListTableViewController ()<UIAlertViewDelegate>
@property(nonatomic)NSMutableArray *items;
//@property(nonatomic)NSArray *categories;
@end

@implementation ToDoListTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
        //set the tab bar item's title
        self.tabBarItem.title=@"ToDo List";
        
        UIImage *i=[UIImage imageNamed:@"icon_energyburn@2x.png"];
        
        self.tabBarItem.image = [i imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];

    self.items= @[@{@"name":@"Plank 10*3",@"cateory":@"Strength Training"}].mutableCopy;
    //self.categories=@[@"Strength Training",@"Cardio"];
    self.navigationItem.title= @"ToDo List";
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(toggleEditing:)];
    

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*-(NSArray*)itemsInCategory:(NSString *)targetCategory{

    NSPredicate *matchingPredicate=[NSPredicate predicateWithFormat:@"category == %@",targetCategory];

    NSArray *categoryItems=[self.items filteredArrayUsingPredicate:matchingPredicate];
    
    return categoryItems;
}

-(NSInteger)numberOfItemsInCategory:(NSString*)targetCategory{

    return [self itemsInCategory:targetCategory ].count;

}

-(NSDictionary*)itemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *category=self.categories[indexPath.section];
    NSArray *categoryItems=[self itemsInCategory:category];
    NSDictionary *item=categoryItems[indexPath.row];
    return item;

}

-(NSInteger)itemIndexForIndexPath:(NSIndexPath *)indexPath{

    NSDictionary *item=[self itemAtIndexPath:indexPath];
    NSInteger index=[self.items indexOfObjectIdenticalTo:item];
    return index;


}

-(void)removeItemAtIndexPath:(NSIndexPath *)indexPath{

    NSInteger index=[self itemIndexForIndexPath:indexPath];
    [self.items removeObjectAtIndex:index];

}*/


#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
    //return self.categories.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.items.count;
    //return [self numberOfItemsInCategory:self.categories[section]];
}

-(void) addNewItem:(UIBarButtonItem *)sender{
    
    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"New to-do item" message:@"Please enter the name of the new to-do item" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"add item", nil];
    alertView.alertViewStyle=UIAlertViewStylePlainTextInput;
    [alertView show];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex!=alertView.cancelButtonIndex) {
        UITextField *itemNameField=[alertView textFieldAtIndex:0];
        NSString *itemName=itemNameField.text;
        NSDictionary *item=@{@"name" :itemName, @"category": @"Home"};
       // NSInteger numHomeItems=[self numberOfItemsInCategory:@"Home"];
        
        [self.items addObject:item];
        
       // [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:numHomeItems-1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.items.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainCell"];
    }
    
    NSDictionary *item=self.items[indexPath.row];
    //NSDictionary *item=[self itemAtIndexPath:indexPath];
    
    cell.textLabel.text=item[@"name"];
    // Configure the cell...
    if ([item[@"completed"]boolValue]) {
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
        
    }else{
        cell.accessoryType=UITableViewCellAccessoryNone;

    }
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //NSInteger index=[self itemIndexForIndexPath:indexPath];

  //  NSMutableDictionary *item= [self.items[index]mutableCopy];
    
    
    NSMutableDictionary *item= [self.items[indexPath.row]mutableCopy];
    BOOL completed=[item[@"completed"]boolValue];
    item[@"completed"]=@(!completed);
    
    //self.items[index]=item;
    
    self.items[indexPath.row]=item;
    
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType=([item[@"completed"]boolValue])? UITableViewCellAccessoryCheckmark:UITableViewCellAccessoryNone;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

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

/*-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.categories[section];

}*/


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
