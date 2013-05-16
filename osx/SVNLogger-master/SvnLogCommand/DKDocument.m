//
//  DKDocument.m
//  SvnLogCommand
//
//  Created by Support on 8/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DKDocument.h"

@implementation DKDocument
@synthesize svnCommandPanel = _svnCommandPanel;
@synthesize svnLogModel = _svnLogModel;;
- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        // If an error occurs here, return nil.
        self.svnLogModel = [[DKSvnLogModel alloc] init];
    }
    return self;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"DKDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
    
    
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    /*
     Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    */
    
    return [NSKeyedArchiver archivedDataWithRootObject:self.svnLogModel]; 
//    NSException *exception = [NSException exceptionWithName:@"UnimplementedMethod" reason:[NSString stringWithFormat:@"%@ is unimplemented", NSStringFromSelector(_cmd)] userInfo:nil];
//    @throw exception;
//    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    /*
    Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    */
    self.svnLogModel = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    NSLog(@"input = %@, %@, %@",self.svnLogModel.firstDate, self.svnLogModel.secondDate, self.svnLogModel.svnURL);
//    NSException *exception = [NSException exceptionWithName:@"UnimplementedMethod" reason:[NSString stringWithFormat:@"%@ is unimplemented", NSStringFromSelector(_cmd)] userInfo:nil];
//    @throw exception;
    return YES;
}

#pragma mark toolbar associated actions

- (IBAction)showSVNCommand:(id)sender {
    [NSApp beginSheet:self.svnCommandPanel modalForWindow:[[[self windowControllers] objectAtIndex:0] window] modalDelegate:self didEndSelector:@selector(didEndSheet:returnCode:contextInfo:) contextInfo:nil];
}

- (IBAction)doneButtonAction:(id)sender {
    [NSApp endSheet:[sender window]];
}

- (IBAction)launchInTerminal:(id)sender {
    NSString *appleScriptCommand = [[NSString alloc] initWithFormat:@"tell application \"Terminal\" to do script \"%@\"",[self.svnLogModel logCommand]];
    NSAppleScript *as = [[NSAppleScript alloc] initWithSource:appleScriptCommand];
    [as executeAndReturnError:nil];
}

- (void)didEndSheet:(NSWindow *)sheet returnCode:(NSInteger)returnCode contextInfo:(void*)contextInfo
{
    NSLog(@"returnCode:%ld",returnCode);
    [sheet close];
}


- (IBAction)reset:(id)sender
{
    [self.svnLogModel setToDefault];
}
- (IBAction)compute:(id)sender
{
    [self.svnLogModel obtainSvnLogResultBetweenSelectedDateRanges];
}
@end
