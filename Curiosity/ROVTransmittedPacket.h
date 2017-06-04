//
//  ROVCommandPacket.h
//  Curiosity
//
//  Created by Vincent Coetzee on 2017/06/04.
//  Copyright © 2017 Vincent Coetzee. All rights reserved.
//

#import "Rover.h"
#import "ROVCommand.h"
#import "ROVCardinalDirection.h"
#import "ROVCommandPacket.h"

//
// A command packet contains the squirt of commands
// and metadata received from NASA
//

@interface ROVTransmittedPacket : NSObject <ROVCommandPacket>

@property(readonly,assign) GridPoint gridExtent;
@property(readonly,assign) GridPoint roverStartPoint;
@property(readonly,retain) ROVCardinalDirection* roverStartDirection;
@property(readonly,retain) NSArray<ROVCommand*>* commandSequence;

//
// The public interface to the class
//

+ (instancetype) newFromFileAtPath: (NSString*) path;
- (instancetype) initFromFileAtPath: (NSString*) path;

@end
