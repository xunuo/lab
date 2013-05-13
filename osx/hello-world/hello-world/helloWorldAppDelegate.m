//
//  helloWorldAppDelegate.m
//  hello-world
//
//  Created by snow on 13-5-8.
//  Copyright (c) 2013年 snow. All rights reserved.
//

#import "helloWorldAppDelegate.h"

@implementation helloWorldAppDelegate

- (void)dealloc
{
    
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSLog(@"我在初始化时候输出");
}

- (IBAction)helloWorldBtn:(id)sender {
    
    // sender返回调用者本身
    NSLog(@"%@",sender);
    
    //sender.text = "1111";
    
    // 创建字符串
    NSString *str = @"hello-world";
    //NSString *str = [[NSString alloc] initWithFormat:@"Hello,%@", @"snow"];
    
    // 输出调试信息
    NSLog(@"\nHello %@(%@), did you clicked the '%@' button?\n", NSUserName(), NSFullUserName(), str);
    
}

- (IBAction)closeBtn:(id)sender {
    //[_window close];
    [NSApp terminate:nil];
}
@end
