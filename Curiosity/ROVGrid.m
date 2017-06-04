//
//  ROVGrid.m
//  Curiosity
//
//  Created by Vincent Coetzee on 2017/06/04.
//  Copyright © 2017 Vincent Coetzee. All rights reserved.
//

#import "ROVGrid.h"

//
// We declare this extension here so that we can set the
// values of these instance variables, but they remain
// readonly to the rest of the universe
//

@interface ROVGrid ()

@property(readwrite,assign) GridPoint extent;
@property(readwrite,assign) NSUInteger size;

@end

@implementation ROVGrid

+ (instancetype) gridWithExtent: (GridPoint) point
    {
    return([[self new] initWithExtent: point]);
    }

- (instancetype) initWithExtent: (GridPoint) point
    {
    self = [super init];
    if (self)
        {
        self.extent = point;
        self.size = point.x * point.y;
        }
    return(self);
    }

- (void) validateProposedLocation: (GridPoint) point
    {
    if (point.x < 0 || point.x > self.extent.x)
        {
        [NSException raise: @"Rover" format: @"X Bounds of grid exceeded"];
        }
    if (point.y < 0 || point.y > self.extent.y)
        {
        [NSException raise: @"Rover" format: @"Y Bounds of grid exceeded"];
        }
    }

@end
