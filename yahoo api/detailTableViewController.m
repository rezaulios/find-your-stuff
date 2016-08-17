//
//  detailTableViewController.m
//  yahoo api
//
//  Created by MDREZAUL KARIM on 6/20/16.
//  Copyright © 2016 MD REZAUL KARIM. All rights reserved.
//

#import "detailTableViewController.h"
#import "customTableViewCell.h"
#import "thirdViewController.h"

@interface detailTableViewController () <customcelldelegate>{
    
    
    
    NSArray * resultsarray;
    
    NSString * urlstring;
    
    NSArray * urlArray;
    
}

@end

@implementation detailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.stuff;
    
    NSString * strurl = [NSString stringWithFormat:@"https://query.yahooapis.com/v1/public/yql?q=select%%20*%%20from%%20local.search%%20where%%20zip%%3D'%@'%%20and%%20query%%3D'%@'&format=json&callback=",self.zipcode,self.stuff ];
    
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:strurl]];
    
   // NSLog(@"%@",data);
    
    
    NSDictionary * jasondict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
   
   
 //   NSLog(@"%@",jasondict);
    
    
    resultsarray = [[[jasondict objectForKey:@"query"]objectForKey:@"results"]objectForKey: @"Result"];
    
    NSLog(@"%@",resultsarray);
    
       
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return resultsarray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
       [cell drawThisCell:[resultsarray objectAtIndex:indexPath.row]];
    cell.delegate = self;
   
     
    return cell;

}

-(void)setupAlertControl{
    
    self.alertcntrl = [UIAlertController alertControllerWithTitle:@"SORRY!!!" message:@"no message found" preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [_alertcntrl addAction:action];
    [self presentViewController:_alertcntrl animated:YES completion:nil];
    
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
    
    NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
    thirdViewController * tvc = segue.destinationViewController;
    tvc.currentStuff = [resultsarray objectAtIndex:indexPath.row];
}


@end
