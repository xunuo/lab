//
//  TheAppController.m
//  012-Show-Panel
//
//  Created by julius on 25/07/2008.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "TheAppController.h"
#import "TheWindowController.h"


@implementation TheAppController

- (IBAction)showTheWindow:(id)pId;
{
	NSLog(@"Hi from TheAppController showTheWindow");
	if (! myTheWindowController ) {
		myTheWindowController	= [[TheWindowController alloc] init];
	} // end if
	
	[myTheWindowController showWindow:self];
	
} // end showTheWindow
@end
