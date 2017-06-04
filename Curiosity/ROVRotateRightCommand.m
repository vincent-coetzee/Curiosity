//
//  ROVRotateRightCommand.m
//  Curiosity
//
//  Created by Vincent Coetzee on 2017/06/04.
//  Copyright © 2017 Vincent Coetzee. All rights reserved.
//

#import "ROVRotateRightCommand.h"
#import "ROVRover.h"

@implementation ROVRotateRightCommand

- (void) applyToRover: (ROVRover*) rover
    {
    [rover rotateRight];
    }

@end
