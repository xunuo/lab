//
//  RunShellAppDelegate.m
//  run-shell
//
//  Created by snow on 13-5-8.
//  Copyright (c) 2013年 snow. All rights reserved.
//

#import "RunShellAppDelegate.h"
#import "Taskit.h"


@implementation RunShellAppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)runBtn:(id)sender {
    
    
    // 例子：https://github.com/fileability/taskit/blob/master/Testing/taskit-test/TaskitTest.m
    Taskit *task = [Taskit task];
    //task.launchPath = @"/bin/pwd";
    
    
    //task.launchPath = @"/Users/snow/Documents/server/tianma-intl-style/startws";
    
    //[task populateWithCurrentEnvironment];
    
    
    
    //task.workingDirectory = @"/Users/snow/Documents/server/tianma-intl-style";
    
    //[task.arguments addObject:@"--version"];
    
    //task.launchPath = @"/usr/local/bin/tianma";
    //[task.arguments addObject:@"--version"];
    
    
    /*
    task.launchPath = @"/usr/local/bin/node";
    [task.arguments addObject:@"--version"];
    
    task.workingDirectory = @"/Users/snow/Documents/server/tianma-intl-style";
    
    // [task.arguments addObject:@"Hello World"];
    //[task.arguments addObject:@"-help"];
    task.receivedOutputString = ^void(NSString *output) {
        NSLog(@"%@", output);
    };
    
    [task.environment setValue:@"NODE_PATH" forKey:@"tianma libpath"];
    
    [task launch];
    */
    
    /*
    Taskit *task2 = [Taskit task];
    task2.launchPath = @"/usr/local/bin/node";
    [task2.arguments addObject:@"--version"];
    task2.workingDirectory = @"/Users/snow/Documents/test/";
    task2.receivedOutputString = ^void(NSString *output) {
        NSLog(@"%@", output);
    };
    [task2 launch];
    */

    
    NSLog(@"[[echo]]");
    Taskit *task3 = [Taskit task];
    //[task3 populateWithCurrentEnvironment];
    
    [task.environment setValue:@"node" forKey:@"/usr/local/bin/node"];
    
    task3.launchPath = @"/usr/local/bin/npm";
    [task3.arguments addObject:@"--version"];
    
    [task3 launch];
    NSLog(@"[echo:output] '%@'", [task3 waitForOutputString]);
    
}

- (IBAction)runOBtn:(id)sender {
    
    NSTask *task;
    task = [[NSTask alloc] init];
    //[task setLaunchPath:@"/bin/bash"];
    //[task setLaunchPath: @"/bin/pwd"];

    
    [task setLaunchPath: @"/Users/snow/Documents/server/tianma-intl-style/startws"];
    [task setLaunchPath: @"/Users/snow/Documents/server/tianma-intl-style/killws"];
    
    NSArray *arguments;
    // arguments = [NSArray arrayWithObjects: @"-l", @"-a", @"-t", nil];
    //arguments = [NSArray arrayWithObjects: @"-c", @"/Users/snow/Documents/server/tianma-intl-style/startws",nil];
    arguments = [NSArray arrayWithObjects: nil];
    [task setArguments: arguments];
    
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    // 设定当前运行目录
    [task setCurrentDirectoryPath:@"/Users/snow/Documents/server/tianma-intl-style/"];
    
    //[task setEnvironment:[NSDictionary dictionaryWithObjectsAndKeys:NSHomeDirectory(), @"/usr/local/bin/", NSUserName(), @"snow", nil]];

    // 重要 设定环境变量
    NSDictionary *defaultEnvironment = [[NSProcessInfo processInfo] environment];
    NSMutableDictionary *environment = [[NSMutableDictionary alloc] initWithDictionary:defaultEnvironment];
    // 多个Path使用分隔符: tianma对于多path貌似无法启动 仅保留/usr/local/bin/ ok    其它 :/usr/bin/:/bin/
    [environment setObject:@"/bin:/usr/bin:/usr/local/bin" forKey:@"PATH"];
    [environment setObject:@"tianma libpath" forKey:@"NODE_PATH"];
    [task setEnvironment:environment];
    
    
    //task.environment = [NSProcessInfo processInfo].environment;
    [task launch];
    [task waitUntilExit];
    
    NSData *data;
    data = [file readDataToEndOfFile];
    
    NSString *string;
    string = [[NSString alloc] initWithData: data
                                   encoding: NSUTF8StringEncoding];
    
    int status = [task terminationStatus];

    if (0 != status) {
        NSLog (@"output(status-%d):\n%@", status ,string);
    }else{
        NSLog (@"output(status-0):\n%@" ,string);
    }

 
}

- (IBAction)runSBtn:(id)sender {
    
    //system("ls -a -l");
    //system("/usr/local/bin/node --version");

    NSDictionary *error = [NSDictionary new];
    // 对于执行需要权限的操作良好
    //NSString *script =  @"do shell script \"rm /Users/snow/Desktop/Untitled.html\" with administrator privileges";
    NSString *script =  @"do shell script \"export PATH=/usr/local/bin/ & cd /Users/snow/Documents/server/tianma-intl-style/ & /Users/snow/Documents/server/tianma-intl-style/startws\"";
    NSAppleScript *appleScript = [[NSAppleScript new] initWithSource:script];
    NSAppleEventDescriptor *des = [appleScript executeAndReturnError:&error];
    NSLog(@"%@",des.stringValue);
    
}

/*
- (void)obtainSvnLogResultBetweenSelectedDateRanges
{
    self.complete = NO;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *firstDateString = [[NSString alloc] initWithFormat:@"{%@}",[dateFormatter stringFromDate:self.firstDate]];
    NSString *secondDateString = [[NSString alloc] initWithFormat:@"{%@}",[dateFormatter stringFromDate:self.secondDate]];
    NSString *dateRangeString = [[NSString alloc] initWithFormat:@"%@:%@",firstDateString,secondDateString];
    
    // executing command
    
    NSTask *svnLogCommand = [[NSTask alloc] init];
    [svnLogCommand setLaunchPath:@"/usr/bin/svn"];
    [svnLogCommand setArguments:[[NSArray alloc] initWithObjects:@"log",@"-v",@"-r",dateRangeString,self.svnURL,nil]];
    // framing log command to display to user
    self.logCommand = [[NSString alloc] initWithFormat:@"%@ %@",[[svnLogCommand launchPath] lastPathComponent],[[svnLogCommand arguments] componentsJoinedByString:@" "]];
    
    NSPipe *outPipe = [NSPipe pipe];
    [svnLogCommand setStandardOutput:outPipe];
    
    [svnLogCommand launch];
    [svnLogCommand waitUntilExit];
    
    NSFileHandle *read = [outPipe fileHandleForReading];
    NSData *dataRead = [read readDataToEndOfFile];
    
    self.output =  [[NSString alloc] initWithData:dataRead encoding:NSUTF8StringEncoding];
    self.complete = YES;
}
 */


@end
