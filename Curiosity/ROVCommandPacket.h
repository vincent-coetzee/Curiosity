//
//  ROVCommandPacket.h
//  Curiosity
//
//  Created by Vincent Coetzee on 2017/06/04.
//  Copyright © 2017 Vincent Coetzee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rover.h"
#import "ROVCardinalDirection.h"
#import "ROVCommand.h"

@protocol ROVCommandPacket <NSObject>

@property(readonly,assign) GridPoint gridExtent;
@property(readonly,assign) GridPoint roverStartPoint;
@property(readonly,retain) ROVCardinalDirection* roverStartDirection;
@property(readonly,retain) NSArray<ROVCommand*>* commandSequence;

@end
