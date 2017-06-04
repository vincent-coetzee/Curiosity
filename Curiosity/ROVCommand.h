//
//  ROVCommand.h
//  Curiosity
//
//  Created by Vincent Coetzee on 2017/06/04.
//  Copyright © 2017 Vincent Coetzee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ROVRover;

typedef NS_ENUM(NSUInteger,Command)
    {
    Move,
    RotateRight,
    RotateLeft
    };

@interface ROVCommand : NSObject

@property(readonly,assign) Command command;

+ (NSArray<ROVCommand *>*) commandSequenceFromString: (NSString*) string;
+ (instancetype) commandFromChar: (char) aChar;
- (void) applyToRover: (ROVRover*) rover;

@end
