//
//  DKDocument.h
//  SvnLogCommand
//
//  Created by Support on 8/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DKSvnLogModel.h"

@interface DKDocument : NSDocument

@property (readwrite, retain) DKSvnLogModel *svnLogModel;
- (IBAction)showSVNCommand:(id)sender;
- (IBAction)doneButtonAction:(id)sender;
- (IBAction)launchInTerminal:(id)sender;

- (IBAction)reset:(id)sender;
- (IBAction)compute:(id)sender;
@property (assign) IBOutlet NSPanel *svnCommandPanel;

@end
