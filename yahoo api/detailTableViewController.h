//
//  detailTableViewController.h
//  yahoo api
//
//  Created by MDREZAUL KARIM on 6/20/16.
//  Copyright © 2016 MD REZAUL KARIM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "customTableViewCell.h"
@interface detailTableViewController : UITableViewController


@property (nonatomic,strong) NSString * stuff;
@property (nonatomic,strong) NSString * zipcode;
@property(nonatomic,weak) UIAlertController * alertctrl;
@property(weak,nonatomic) UIAlertController * alertcntrl;
-(void)setupAlertControl;
@end
