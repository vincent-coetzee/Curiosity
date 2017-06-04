//
//  ROVTestPacket.h
//  Curiosity
//
//  Created by Vincent Coetzee on 2017/06/04.
//  Copyright © 2017 Vincent Coetzee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ROVCommandPacket.h"

@interface ROVTestPacket : NSObject <ROVCommandPacket>

@property(readwrite,assign) GridPoint gridExtent;
@property(readwrite,assign) GridPoint roverStartPoint;
@property(readwrite,retain) ROVCardinalDirection* roverStartDirection;
@property(readwrite,retain) NSArray<ROVCommand*>* commandSequence;

+ (instancetype) upAndDownTest;
+ (instancetype) backAndForthTest;
+ (instancetype) skirtEdgeTest;

@end
