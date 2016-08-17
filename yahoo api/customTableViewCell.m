//
//  customTableViewCell.m
//  yahoo api
//
//  Created by MDREZAUL KARIM on 6/22/16.
//  Copyright © 2016 MD REZAUL KARIM. All rights reserved.
//

#import "customTableViewCell.h"
#import "detailTableViewController.h"

@implementation customTableViewCell

-(id)initWithViewController:(UIViewController *)c{
    
    if (self = [super init]) {
        _ctrl = c;
    }
    
    return self;
}

-(void) drawThisCell:(NSDictionary *)resultDictionary {
    
    if([[resultDictionary objectForKey:@"Title"] isKindOfClass:[NSNull class]]){
        self.name.text = @"NA";
    }else{
        self.name.text = [resultDictionary objectForKey:@"Title"];
    }
    
    if ([[resultDictionary objectForKey:@"City"] isKindOfClass:[NSNull class ]] || [[resultDictionary objectForKey:@"State"] isKindOfClass:[NSNull class]] || [[resultDictionary objectForKey:@"Address"] isKindOfClass:[NSNull class]]){
        self.address.text = @"NA";
    }else{
        self.address.text = [NSString stringWithFormat:@"Address:%@,%@ ,%@", [resultDictionary objectForKey:@"Address"], [resultDictionary objectForKey:@"City"] ,[resultDictionary objectForKey:@"State"]];
    }
    if([[resultDictionary objectForKey:@"BusinessUrl"] isKindOfClass:[NSNull class]]){
        [self.urlButton setTitle:@"No website found" forState:UIControlStateNormal];
    } else {
        [self.urlButton setTitle:[NSString stringWithFormat:@"website: %@",[resultDictionary objectForKey:@"BusinessUrl"]] forState:UIControlStateNormal] ;
    }
    [self.urlButton addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
    
    self.urlString =[resultDictionary objectForKey:@"BusinessUrl"];
    
}
//-(void)setupAlertControl{
//    
//    UIAlertController * alertcntrl = [UIAlertController alertControllerWithTitle:@"SORRY!!!" message:@"no message found" preferredStyle:UIAlertControllerStyleAlert];
//    
//    
//    UIAlertAction * action = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
//        
//    }];
//    [alertcntrl addAction:action];
//   
//    
//    
//    [_ctrl presentViewController:alertcntrl animated:YES completion:nil];
//    NSLog(@"clicked");
//}
-(void)clicked {
    if (![self.urlButton.titleLabel.text isEqualToString:@"No website found"]) {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.urlString]];
    }else{
        [self.delegate  setupAlertControl];
        [_ctrl.navigationController popViewControllerAnimated:YES];
        NSLog(@"its my controller");
}
   
    }

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
