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

    

    
}

- (IBAction)runOBtn:(id)sender {
    
    NSTask *task;
    task = [[NSTask alloc] init];
    [task setLaunchPath: @"/bin/ls"];
    
    NSArray *arguments;
    arguments = [NSArray arrayWithObjects: @"-l", @"-a", @"-t", nil];
    [task setArguments: arguments];
    
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    [task launch];
    
    NSData *data;
    data = [file readDataToEndOfFile];
    
    NSString *string;
    string = [[NSString alloc] initWithData: data
                                   encoding: NSUTF8StringEncoding];
    NSLog (@"got\n%@", string);
    
}

- (IBAction)runSBtn:(id)sender {
    
    system("ls -a -l");
    system("/usr/local/bin/node --version");
    
}
@end
