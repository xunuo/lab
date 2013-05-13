//
//  selectFileOrDirAppDelegate.m
//  select-file-or-dir
//
//  Created by snow on 13-5-13.
//  Copyright (c) 2013年 snow. All rights reserved.
//

#import "selectFileOrDirAppDelegate.h"

@implementation selectFileOrDirAppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)selectdirbtn:(id)sender {
    
    NSOpenPanel *oPanel = [NSOpenPanel openPanel]; //快捷建立方式不用释放, 我还记得, 你呢?
    
	[oPanel setCanChooseDirectories:YES]; //可以打开目录
	[oPanel setCanChooseFiles:NO]; //不能打开文件(我需要处理一个目录内的所有文件)
	[oPanel setDirectory:NSHomeDirectory()]; //起始目录为Home
    
    
	if ([oPanel runModal] == NSOKButton) {  //如果用户点OK
		NSLog([[[oPanel URLs] objectAtIndex:0] absoluteString]);
		//我在console输出这个目录的地址
	}
    
    // 打印出其中内容

    NSArray *contentArray = [[NSFileManager defaultManager]
                             contentsOfDirectoryAtURL:[[oPanel URLs] objectAtIndex:0]
                             //oPanel是上个帖子中的NSOpenPanel对象
                             includingPropertiesForKeys:[NSArray array]
                             options:0 
                             error:nil];
    
    
    for(id innerUrl in contentArray)
	{
		NSLog([innerUrl absoluteString]);
	}
    
    /*
    NSArray *aArray; //我们的Array，假设他已经初始化有内容了
    
    for(id innerObj in aArray) //id可以由其他对象类型替代
    {
        //也就是说, 在循环中的参数innerObj就是aArray中的对象
        //由于NSArray中只能储存对象，所以我们使用id作为内涵对象的类型，其实就是个指针了
        //而且如果NSArray中的内容不一致，id更不会出现冲突
    }
     */
    
}
@end
