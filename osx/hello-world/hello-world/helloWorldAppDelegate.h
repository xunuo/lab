//
//  helloWorldAppDelegate.h
//  hello-world
//
//  Created by snow on 13-5-8.
//  Copyright (c) 2013年 snow. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface helloWorldAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

- (IBAction)helloWorldBtn:(id)sender;

@end
