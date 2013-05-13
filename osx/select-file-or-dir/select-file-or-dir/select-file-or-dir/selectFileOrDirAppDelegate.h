//
//  selectFileOrDirAppDelegate.h
//  select-file-or-dir
//
//  Created by snow on 13-5-13.
//  Copyright (c) 2013年 snow. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface selectFileOrDirAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
- (IBAction)selectdirbtn:(id)sender;


@end
