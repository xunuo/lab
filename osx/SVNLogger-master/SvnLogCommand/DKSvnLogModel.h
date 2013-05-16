//
//  DKSvnLogModel.h
//  SVNLogger
//
//  Created by Support on 8/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DKSvnLogModel : NSObject <NSCoding>
@property (readwrite, retain) NSDate *firstDate;
@property (readwrite, retain) NSDate *secondDate;
@property (readwrite, retain) NSString *svnURL;
@property (readwrite, retain) NSString *output;
@property (readwrite, retain) NSString *logCommand;
@property (assign, getter = isComplete) BOOL complete;
- (void)setToDefault;
- (void)obtainSvnLogResultBetweenSelectedDateRanges;
@end
