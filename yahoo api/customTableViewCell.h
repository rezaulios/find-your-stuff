//
//  customTableViewCell.h
//  yahoo api
//
//  Created by MDREZAUL KARIM on 6/22/16.
//  Copyright © 2016 MD REZAUL KARIM. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "detailTableViewController.h"
@class customTableViewCell;

@protocol customcelldelegate <NSObject>

-(void) setupAlertControl;

@end





@interface customTableViewCell : UITableViewCell
//@property(nonatomic,strong) UIViewController * ctrl;



-(id)initWithViewController: (UIViewController *)c;


@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *address;

@property (weak, nonatomic) IBOutlet UIButton *urlButton;

@property (strong, nonatomic) NSString *urlString;
@property(weak,nonatomic) UIAlertController * alertcntrl;
-(void) drawThisCell:(NSDictionary *)resultDictionary;

//-(void)setupAlertControl;

@property(nonatomic,strong) UIViewController * ctrl;
//@property(nonatomic,strong)
@property(weak,nonatomic) id<customcelldelegate>delegate;



@end
