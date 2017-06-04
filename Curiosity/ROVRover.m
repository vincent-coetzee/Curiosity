//
//  ROVRover.m
//  Curiosity
//
//  Created by Vincent Coetzee on 2017/06/04.
//  Copyright © 2017 Vincent Coetzee. All rights reserved.
//

#import "ROVRover.h"
#import "ROVGrid.h"

#define DEFAULT_AMOUNT_TO_MOVE 1

@implementation ROVRover
    {
    __strong ROVGrid* currentGrid;
    GridPoint currentLocationInGrid;
    __strong ROVCardinalDirection* currentDirection;
    __strong NSArray<ROVCommand*>* currentCommandSequence;
    NSUInteger movementQuantum;
    }

- (instancetype) init
    {
    self = [super init];
    if (self)
        {
        movementQuantum = DEFAULT_AMOUNT_TO_MOVE;
        }
    return(self);
    }

- (GridPoint) currentLocation
    {
    return(currentLocationInGrid);
    }

- (ROVCardinalDirection*) currentDirection
    {
    return(currentDirection);
    }

- (void) executeCommandPacket: (id <ROVCommandPacket>) packet
    {
    [self initStateFromCommandPacket: packet];
    [self executeCurrentCommandSequence];
    }

- (void) initStateFromCommandPacket: (id <ROVCommandPacket>) packet
    {
    currentGrid = [ROVGrid gridWithExtent: packet.gridExtent];
    currentLocationInGrid = packet.roverStartPoint;
    currentDirection = packet.roverStartDirection;
    currentCommandSequence = packet.commandSequence;
    }

- (void) executeCurrentCommandSequence
    {
    for (ROVCommand* command in currentCommandSequence)
        {
        [command applyToRover: self];
        }
    }

- (void) moveForward
    {
    GridPoint newLocation;
    
    newLocation = [currentDirection adjustedGridPointAfterMovingForward: currentLocationInGrid byAmount: movementQuantum];
    [currentGrid validateProposedLocation: newLocation];
    currentLocationInGrid = newLocation;
    }

- (void) rotateLeft
    {
    currentDirection = [currentDirection rotatedLeft];
    }

- (void) rotateRight
    {
    currentDirection = [currentDirection rotatedRight];
    }

- (void) printLocation
    {
    NSLog(@"%ld %ld %@\n",currentLocationInGrid.x,currentLocationInGrid.y,currentDirection.displayString);
    }

@end
