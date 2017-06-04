//
//  ROVRotateLeftCommand.m
//  Curiosity
//
//  Created by Vincent Coetzee on 2017/06/04.
//  Copyright © 2017 Vincent Coetzee. All rights reserved.
//

#import "ROVRotateLeftCommand.h"
#import "ROVRover.h"

@implementation ROVRotateLeftCommand

- (void) applyToRover: (ROVRover*) rover
    {
    [rover rotateLeft];
    }

@end
