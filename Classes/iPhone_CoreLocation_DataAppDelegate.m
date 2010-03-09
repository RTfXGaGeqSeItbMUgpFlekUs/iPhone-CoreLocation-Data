//
//  iPhone_CoreLocation_DataAppDelegate.m
//  iPhone_CoreLocation Data
//
//  Created by Martin Brandenburg on 3/8/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "iPhone_CoreLocation_DataAppDelegate.h"
#import "RootViewController.h"


@implementation iPhone_CoreLocation_DataAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize rootViewController;
@synthesize mapViewController;
@synthesize mapView;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
	[rootViewController initWithNibName:@"RootViewController" bundle:nil];
	
	clManager = [[CLLocationManager alloc] init];
	
	if ([clManager locationServicesEnabled] == NO) {
		NSLog(@"Location Services are disabled.");
	} else {
		NSLog(@"Location Services are enabled.");
	}
	[clManager setDelegate:self];
	[clManager startUpdatingLocation];
	
	return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
	NSLog(@"Got error: %@", [error localizedDescription]);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	NSLog(@"Got update: %@", [newLocation description]);
	
	[rootViewController updateData:newLocation];
}

- (IBAction)update:(id)sender {
	[rootViewController updateData:[clManager location]];
}

- (IBAction)displayMap:(id)sender {
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.longitudeDelta = 0.01;
	span.latitudeDelta = 0.01;
	region.center = [clManager location].coordinate;
	region.span = span;
	
	[self.navigationController pushViewController:mapViewController animated:YES];
	[mapView setRegion:region animated:YES];
	[mapView setCenterCoordinate:[clManager location].coordinate animated:YES];
	
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[rootViewController release];
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

