//
//  ROVCommand.m
//  Curiosity
//
//  Created by Vincent Coetzee on 2017/06/04.
//  Copyright © 2017 Vincent Coetzee. All rights reserved.
//

#import "ROVCommand.h"
#import "ROVMoveCommand.h"
#import "ROVRotateLeftCommand.h"
#import "ROVRotateRightCommand.h"
#import "ROVRover.h"

@implementation ROVCommand

+ (NSArray<ROVCommand *>*) commandSequenceFromString: (NSString*) string
    {
    NSMutableArray<ROVCommand*>* commands;
    
    commands = [NSMutableArray<ROVCommand*> array];
    for (const char* pointer = [string UTF8String];*pointer != 0;pointer++)
        {
        [commands addObject: [ROVCommand commandFromChar: *pointer]];
        }
    return(commands);
    }
    
+ (instancetype) commandFromChar: (char) aChar
    {
    switch(aChar)
        {
    case('M'):
        return([ROVMoveCommand new]);
    case('R'):
        return([ROVRotateRightCommand new]);
    case('L'):
        return([ROVRotateLeftCommand new]);
    default:
        // this should never happen because we validated the command sequence
        // but in case it does, we return the null op
        return([ROVCommand new]);
        }
    }

- (void) applyToRover: (ROVRover*) rover
    {
    // This is the null op, this means we receiver an invalid command
    printf("An invalid command was sent to the rover, ignoring it\n");
    }

@end
