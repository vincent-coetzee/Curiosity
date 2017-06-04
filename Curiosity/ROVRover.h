//
//  ROVRover.h
//  Curiosity
//
//  Created by Vincent Coetzee on 2017/06/04.
//  Copyright © 2017 Vincent Coetzee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ROVCommandPacket.h"
#import "ROVCardinalDirection.h"

@interface ROVRover : NSObject

@property(readonly,assign) GridPoint currentLocation;
@property(readonly,assign) ROVCardinalDirection* currentDirection;

- (void) executeCommandPacket: (id <ROVCommandPacket>) packet;
- (void) moveForward;
- (void) rotateLeft;
- (void) rotateRight;
- (void) printLocation;

@end
