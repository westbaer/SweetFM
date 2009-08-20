//
//  HAdium.h
//  SweetFM
//
//  Created by Nicolas Haunold on 8/20/09.
//  Copyright 2009 Nicolas Haunold. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface HAdium : NSObject {

}

+ (HAdium *)instance;

- (void)setAdiumStatus:(NSString *)status;

@end
