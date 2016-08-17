//
//  ViewController.m
//  yahoo api
//
//  Created by MDREZAUL KARIM on 6/20/16.
//  Copyright © 2016 MD REZAUL KARIM. All rights reserved.
//

#import "ViewController.h"
#import "detailTableViewController.h"


@interface ViewController ()<CLLocationManagerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    detailTableViewController* dvc = segue.destinationViewController;
    dvc.stuff = self.enterStuff.text;
    dvc.zipcode = self.enterZipCode.text;
    
}

- (IBAction)getLocation:(id)sender {
      self.locationManager = [[CLLocationManager alloc]init];
    self.geocoder = [[CLGeocoder alloc]init];
    self.locationManager.delegate = self;
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
         [self.locationManager requestWhenInUseAuthorization];
    }else{
        
        [self.locationManager startUpdatingLocation];
    }
   
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
         [self.locationManager startUpdatingLocation];
    }
    
   
    
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    
    
    CLLocation * location = [locations objectAtIndex:0];
    
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if (!error) {
            
        
        CLPlacemark * place = [placemarks objectAtIndex:0];
        self.enterZipCode.text = place.postalCode;
        }else{
            
          self.enterZipCode.text = @"No Location fetched!!";
        }
        
    }];
    
    
    
    
    [self.locationManager stopUpdatingLocation];
   
    
    
    
}






@end
