//
//  ViewController.h
//  yahoo api
//
//  Created by MDREZAUL KARIM on 6/20/16.
//  Copyright © 2016 MD REZAUL KARIM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *enterStuff;
@property (weak, nonatomic) IBOutlet UITextField *enterZipCode;

@property (strong, nonatomic) CLLocationManager * locationManager;
@property(strong, nonatomic) CLGeocoder * geocoder;


@end

