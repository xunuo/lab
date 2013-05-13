//
//  TheWindowController.m
//  012-Show-Panel
//
//  Created by julius on 25/07/2008.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "TheWindowController.h"


@implementation TheWindowController
- (id) init {

	if ( ! (self = [super initWithWindowNibName: @"TheNibWindow"]) ) {
		NSLog(@"init failed in TheWindowController");
		return nil;
	} // end if
	NSLog(@"init OK in TheWindowController");
	
	return self;
} // end init

- (void)windowDidLoad {
	NSLog(@"TheWindowPanel did load");
} // end windowDidLoad

@end
