//
//  iPhone_CoreLocation_DataAppDelegate.h
//  iPhone CoreLocation Data
//
//  Created by Martin Brandenburg on 3/8/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "RootViewController.h"

@interface iPhone_CoreLocation_DataAppDelegate : NSObject <UIApplicationDelegate, CLLocationManagerDelegate> {
    UIWindow *window;
	UINavigationController *navigationController;
    RootViewController *rootViewController;
	UIViewController *mapViewController;
	MKMapView *mapView;
	CLLocationManager *clManager;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet RootViewController *rootViewController;
@property (nonatomic, retain) IBOutlet UIViewController *mapViewController;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation;

- (IBAction)update:(id)sender;
- (IBAction)displayMap:(id)sender;

@end

