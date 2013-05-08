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
    // http://www.cocoachina.com/b/?p=164
    // 这篇比较详细 包含子菜单：http://blog.csdn.net/ccat/article/details/8026323
    
    // 
    // Insert code here to initialize your application
    
    
    _statusItem = [[[NSStatusBar systemStatusBar]statusItemWithLength:NSVariableStatusItemLength] retain];//初始化，并制定大小NSVariableStatusItemLength;
    [_statusItem setHighlightMode:YES];
    [_statusItem setTitle:@"测试菜单"];
    [_statusItem setImage:[NSImage imageNamed:@"icon.tiff"]];//设置图片
    
    NSMenu *menu,*submenu;//创建2个menu;
    
    menu = [[NSMenu alloc] initWithTitle:@"menu"];

    NSMenuItem *menuImportItem = [menu addItemWithTitle:@"打开文件夹" action:@selector(open) keyEquivalent:@""];//添加menu里的选项
    NSMenuItem *menuSelectItem = [menu addItemWithTitle:@"选取文件" action:@selector(selectFile) keyEquivalent:@""];//添加menu里的选项
    NSMenuItem *menuSubmenusItem = [menu addItemWithTitle:@"子菜单" action:@selector(open) keyEquivalent:@""];
    NSMenuItem *menuChangeIconItem = [menu addItemWithTitle:@"修改托盘图标" action:@selector(changeIcon) keyEquivalent:@""];
    NSMenuItem *menuStopItem = [menu addItemWithTitle:@"退出" action:@selector(closeApp) keyEquivalent:@""];
    
    submenu = [[NSMenu alloc] initWithTitle:@"submenu"];
    [submenu addItemWithTitle:@"子菜单选项-1" action:@selector(selectFile) keyEquivalent:@""]; 
    [submenu addItemWithTitle:@"子菜单选项-2" action:@selector(open) keyEquivalent:@""];
    
    [menu setSubmenu:submenu forItem:menuSubmenusItem];

    [_statusItem setMenu:menu];
    [menu release];
}

- (void)open
{
   NSLog(@"open..");
    [[NSWorkspace sharedWorkspace] selectFile:nil inFileViewerRootedAtPath:@"/Users/snow"];
}

- (void)selectFile{

    NSOpenPanel *panel = [NSOpenPanel openPanel];
    
    [panel setPrompt: @"OOXX"];
    
    [panel beginSheetForDirectory: nil
                             file: nil
                            //types: [NSArray arrayWithObject: @"ox"] // 文件类型
                    modalForWindow: _window
                    modalDelegate: self
                   didEndSelector: @selector(openPanelDidEnd:returnCode:contextInfo:)
                      contextInfo: nil];
    
}


- (void)debug
{
    NSLog(@"debuging");
}

- (void)changeIcon
{
    [_statusItem setImage:[NSImage imageNamed:@"icon-tank.jpg"]];//设置图片
}

- (void) openPanelDidEnd: (NSOpenPanel *) sheet
              returnCode: (int) returnCode
             contextInfo: (void *) context
{
    if (returnCode == NSOKButton) {
        NSArray *fileNames = [sheet filenames];
        
        NSLog (@"ooxx: %@", [fileNames objectAtIndex: 0]);
    }
    
}

- (void) closeApp{
     //[_window close];
    [NSApp terminate:nil];
}



@end
