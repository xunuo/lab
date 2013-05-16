//
//  DKSvnLogModel.m
//  SVNLogger
//
//  Created by Support on 8/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DKSvnLogModel.h"

@implementation DKSvnLogModel
@synthesize firstDate = _firstDate, secondDate = _secondDate, svnURL = _svnURL, output = _output, complete = _complete, logCommand = _logCommand;

#pragma mark NSCoding related methods
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.firstDate forKey:@"firstDate"];
    [aCoder encodeObject:self.secondDate forKey:@"secondDate"];
    [aCoder encodeObject:self.svnURL forKey:@"svnURL"];
    [aCoder encodeObject:self.output forKey:@"output"];
    [aCoder encodeObject:[NSNumber numberWithBool:self.complete] forKey:@"complete"];
    [aCoder encodeObject:self.logCommand forKey:@"logCommand"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [self init]) {
        [self setFirstDate:[aDecoder decodeObjectForKey:@"firstDate"]];
        [self setSecondDate:[aDecoder decodeObjectForKey:@"secondDate"]];
        [self setSvnURL:[aDecoder decodeObjectForKey:@"svnURL"]];
        [self setOutput:[aDecoder decodeObjectForKey:@"output"]];
        [self setComplete:[[aDecoder decodeObjectForKey:@"complete"] boolValue]];
        [self setLogCommand:[aDecoder decodeObjectForKey:@"logCommand"]];
    }
    
    return self;
}
#pragma mark other methods
- (id)init
{
    if (self = [super init]) {
        [self setToDefault];
    }
    return self;
}
- (void)setToDefault
{
    self.firstDate = [[NSDate alloc] init];
    self.secondDate = [[NSDate alloc] init];
    self.complete = YES;
    self.svnURL = @"";
    self.output = [[NSString alloc] init];
    self.logCommand = [[NSString alloc] init];
}

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
@end
