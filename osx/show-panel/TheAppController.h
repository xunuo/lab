//
//  TheAppController.h
//  012-Show-Panel
//
//  Created by julius on 25/07/2008.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class TheWindowController;

@interface TheAppController : NSObject {
	TheWindowController *myTheWindowController;

}
- (IBAction)showTheWindow:(id)pId;


@end
