//
//  RootViewController.h
//  iPhone CoreLocation Data
//
//  Created by Martin Brandenburg on 3/8/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface RootViewController : UITableViewController {
	NSString *coordinateString;
	NSString *altitudeString;
	NSString *horizontalAccuracyString;
	NSString *verticalAccuracyString;
	NSString *timestampString;
}

- (void)updateData:(CLLocation*)location;

@end
