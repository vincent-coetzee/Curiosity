//
//  ROVMoveCommand.m
//  Curiosity
//
//  Created by Vincent Coetzee on 2017/06/04.
//  Copyright © 2017 Vincent Coetzee. All rights reserved.
//

#import "ROVMoveCommand.h"
#import "ROVRover.h"

@implementation ROVMoveCommand

- (void) applyToRover: (ROVRover*) rover
    {
    [rover moveForward];
    }

@end
