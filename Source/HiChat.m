//
//  HiChat.m
//  SweetFM
//
//  Created by Nicolas Haunold on 8/20/09.
//  Copyright 2009 Tapolicious Software. All rights reserved.
//

#import "HiChat.h"
#import "SynthesizeSingleton.h"
#import "HSettings.h"
#import "XLog.h"

@implementation HiChat

SYNTHESIZE_SINGLETON_FOR_CLASS(HiChat, instance);

- (id)init
{
	if(self = [super init])
	{		
		if([HSettings iChatStatusChangeEnabled] == YES)
		{
			//
			// Register for terminate notification (to clear iChat status)
			//
			NSNotificationCenter *notify = [NSNotificationCenter defaultCenter];
			[notify addObserver:self selector:@selector(appWillTerminate)
										name:NSApplicationWillTerminateNotification object:nil];
		}
	}
	
	return self;
}

- (void)appWillTerminate
{
	[self setiChatStatus:nil];
}

- (void)setiChatStatus:(NSString *)status 
{
	if(![HSettings iChatStatusChangeEnabled])
		return;
	
	if(status != nil) 
	{
		status = [status stringByAppendingString:@" (SweetFM)"];
	} else {
		status = @"";
	}

	XLog(@"Changing iChat Status: %@", status);

	NSAppleScript *script = [[NSAppleScript alloc] initWithSource:[NSString stringWithFormat:@"tell application \"iChat\"\nset status message to \"%@\"\nend tell\n", status]];
	[script executeAndReturnError:nil];
	[script release];
}

@end
