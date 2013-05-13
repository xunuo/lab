//
//  plistAppDelegate.m
//  plist
//
//  Created by snow on 13-5-13.
//  Copyright (c) 2013年 snow. All rights reserved.
//

#import "plistAppDelegate.h"

@implementation plistAppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    

        
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"];
        NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
        NSLog(@"%@", data);
        
        //添加一项内容
        [data setObject:@"add some content" forKey:@"c_key"];
        
        //获取应用程序沙盒的Documents目录
        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *plistPath1 = [paths objectAtIndex:0];
        NSLog(@"%@", plistPath1);

        
        //得到完整的文件名
        NSString *filename=[plistPath1 stringByAppendingPathComponent:@"test.plist"];
        //输入写入
        [data writeToFile:filename atomically:YES];
        
        //那怎么证明我的数据写入了呢？读出来看看
        NSMutableDictionary *data1 = [[NSMutableDictionary alloc] initWithContentsOfFile:filename];
        NSLog(@"%@", data1);
        
        
        // Do any additional setup after loading the view, typically from a nib.
    

    
}



@end
