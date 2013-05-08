//
//  RunShellAppDelegate.h
//  run-shell
//
//  Created by snow on 13-5-8.
//  Copyright (c) 2013年 snow. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RunShellAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

- (IBAction)runBtn:(id)sender;
- (IBAction)runOBtn:(id)sender;
- (IBAction)runSBtn:(id)sender;

@end
