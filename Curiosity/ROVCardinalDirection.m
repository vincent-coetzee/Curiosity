//
//  ROVCardinalDirection.m
//  Curiosity
//
//  Created by Vincent Coetzee on 2017/06/04.
//  Copyright © 2017 Vincent Coetzee. All rights reserved.
//

#import "ROVCardinalDirection.h"

#define NORTH (0)
#define EAST (1)
#define SOUTH (2)
#define WEST (3)

@implementation ROVCardinalDirection
    {
    NSUInteger _direction;
    }

+ (instancetype) directionFromChar: (char) aChar
    {
    if (aChar != 'E' && aChar != 'W' && aChar != 'N' && aChar != 'S')
        {
        return(nil);
        }
    return([[self alloc] initWithChar: aChar]);
    }

- (instancetype) initWithChar: (char) aChar
    {
    self = [super init];
    if (self)
        {
        _direction = [self indexOfDirection: aChar];
        }
    return(self);
    }

- (instancetype) initWithIndex: (NSUInteger) index
    {
    self = [super init];
    if (self)
        {
        _direction = index;
        }
    return(self);
    }

- (BOOL) isNorth
    {
    return(_direction == NORTH);
    }

- (BOOL) isSouth
    {
    return(_direction == SOUTH);
    }

- (BOOL) isEast
    {
    return(_direction == EAST);
    }

- (BOOL) isWest
    {
    return(_direction == WEST);
    }

- (NSUInteger) indexOfDirection: (char) aChar
    {
    char directions[] = "NESW";
    
    for (NSUInteger index = 0;index<4;index++)
        {
        if (directions[index] == aChar)
            return(index);
        }
    return(0);
    }

- (NSString*) displayString
    {
    char directions[] = "NESW";
    
    return([NSString stringWithFormat: @"%c",directions[_direction]]);
    }

- (GridPoint) adjustedGridPointAfterMovingForward: (GridPoint) location byAmount: (NSUInteger) amount
    {
    switch(_direction)
        {
    case(NORTH):
        location.y += amount;
        break;
    case(EAST):
        location.x += amount;
        break;
    case(SOUTH):
        location.y -= amount;
        break;
    case(WEST):
        location.x -= amount;
        break;
    default:
        break;
        }
    return(location);
    }

- (instancetype) rotatedLeft
    {
    NSInteger newIndex;
    
    newIndex = _direction - 1;
    if (newIndex < NORTH)
        {
        newIndex = WEST;
        }
    return([[[self class] alloc] initWithIndex: newIndex]);
    }

- (instancetype) rotatedRight
    {
    NSInteger newIndex;
    
    newIndex = _direction + 1;
    if (newIndex > WEST)
        {
        newIndex = NORTH;
        }
    return([[[self class] alloc] initWithIndex: newIndex]);
    }

@end
