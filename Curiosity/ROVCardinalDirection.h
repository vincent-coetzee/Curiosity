//
//  ROVCardinalDirection.h
//  Curiosity
//
//  Created by Vincent Coetzee on 2017/06/04.
//  Copyright © 2017 Vincent Coetzee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rover.h"

@interface ROVCardinalDirection : NSObject

@property(readonly) BOOL isNorth;
@property(readonly) BOOL isSouth;
@property(readonly) BOOL isWest;
@property(readonly) BOOL isEast;

+ (instancetype) directionFromChar: (char) aChar;
- (instancetype) initWithChar: (char) aChar;
- (GridPoint) adjustedGridPointAfterMovingForward: (GridPoint) location byAmount: (NSUInteger) amount;
- (instancetype) rotatedLeft;
- (instancetype) rotatedRight;
- (NSString*) displayString;

@end
