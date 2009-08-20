//
//  HiChat.h
//  SweetFM
//
//  Created by Nicolas Haunold on 8/20/09.
//  Copyright 2009 Tapolicious Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface HiChat : NSObject {

}

+ (HiChat *)instance;

- (void)setiChatStatus:(NSString *)status;

@end
