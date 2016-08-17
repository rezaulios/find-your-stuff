//
//  thirdViewController.m
//  yahoo api
//
//  Created by MDREZAUL KARIM on 7/28/16.
//  Copyright © 2016 MD REZAUL KARIM. All rights reserved.
//

#import "thirdViewController.h"

@interface thirdViewController ()

@end

@implementation thirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [self.currentStuff objectForKey:@"Title"];
    
    
    double lat = [[_currentStuff objectForKey: @"Latitude"]doubleValue];
    double lng = [[_currentStuff objectForKey:@"Longitude"]doubleValue];
    
    
    
    
    
    MKCoordinateRegion region;
    region.center.latitude =lat ;
    region.center.longitude= lng;
    region.span.latitudeDelta = 0.05;
    region.span.longitudeDelta = 0.05;
    [_theMapView setRegion:region];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
