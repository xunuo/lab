//
//  StatusMenuAppDelegate.m
//  status-menu
//
//  Created by snow on 13-5-8.
//  Copyright (c) 2013年 snow. All rights reserved.
//

#import "StatusMenuAppDelegate.h"

@implementation StatusMenuAppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    NSMenu *menu;//创建一个menu;
    statusItem = [[[NSStatusBar systemStatusBar]statusItemWithLength:NSVariableStatusItemLength] retain];//初始化，并制定大小NSVariableStatusItemLength;
    [statusItem setHighlightMode:YES];
    [statusItem setImage:[NSImage imageNamed:@"test"]];//设置图片
    menu = [[NSMenu alloc] initWithTitle:@"xxxxx"];
    [menu addItemWithTitle:@"打开xx" action:@selector(open) keyEquivalent:@""];//添加menu里的选项
    [statusItem setMenu:menu];
    [menu release];
}

@end
