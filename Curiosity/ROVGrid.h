//
//  ROVGrid.h
//  Curiosity
//
//  Created by Vincent Coetzee on 2017/06/04.
//  Copyright © 2017 Vincent Coetzee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rover.h"

@interface ROVGrid : NSObject

@property(readonly) NSUInteger size;
@property(readonly) GridPoint extent;

+ (instancetype) gridWithExtent: (GridPoint) point;
- (void) validateProposedLocation: (GridPoint) point;

@end
