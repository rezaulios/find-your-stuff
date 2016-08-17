//
//  thirdViewController.h
//  yahoo api
//
//  Created by MDREZAUL KARIM on 7/28/16.
//  Copyright © 2016 MD REZAUL KARIM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface thirdViewController : UIViewController

@property (strong, nonatomic) IBOutlet MKMapView *theMapView;

@property(strong, nonatomic)NSDictionary * currentStuff;

@end
