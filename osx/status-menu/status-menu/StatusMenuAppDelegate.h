//
//  StatusMenuAppDelegate.h
//  status-menu
//
//  Created by snow on 13-5-8.
//  Copyright (c) 2013年 snow. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface StatusMenuAppDelegate : NSObject <NSApplicationDelegate>
{
	NSStatusItem		*_statusItem;
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction)menu1:(id)sender;

@end
