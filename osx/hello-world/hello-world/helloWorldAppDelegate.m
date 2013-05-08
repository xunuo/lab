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
    
    // 创建字符串
    NSString *str = @"hello snow";
    //NSString *str = [[NSString alloc] initWithFormat:@"Hello,%@", @"snow"];
    
    // 输出调试信息
    NSLog(@"clicked %@ button\n", str);
    
    
    
    
}
@end
