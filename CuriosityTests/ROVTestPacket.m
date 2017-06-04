//
//  ROVTestPacket.m
//  Curiosity
//
//  Created by Vincent Coetzee on 2017/06/04.
//  Copyright © 2017 Vincent Coetzee. All rights reserved.
//

#import "ROVTestPacket.h"

@implementation ROVTestPacket

+ (instancetype) upAndDownTest
    {
    ROVTestPacket* packet;
    GridPoint extent;
    GridPoint location;
    
    packet = [ROVTestPacket new];
    extent.x = 4;
    extent.y = 4;
    packet.gridExtent = extent;
    location.x = 0;
    location.y = 0;
    packet.roverStartPoint = location;
    packet.roverStartDirection = [ROVCardinalDirection directionFromChar: 'N'];
    packet.commandSequence = [ROVCommand commandSequenceFromString: @"MMMMLLMMMMLL"];
    return(packet);
    }

+ (instancetype) backAndForthTest
    {
    ROVTestPacket* packet;
    GridPoint extent;
    GridPoint location;
    
    packet = [ROVTestPacket new];
    extent.x = 4;
    extent.y = 4;
    packet.gridExtent = extent;
    location.x = 0;
    location.y = 0;
    packet.roverStartPoint = location;
    packet.roverStartDirection = [ROVCardinalDirection directionFromChar: 'E'];
    packet.commandSequence = [ROVCommand commandSequenceFromString: @"MMMMRRMMMMRR"];
    return(packet);
    }

+ (instancetype) skirtEdgeTest
    {
    ROVTestPacket* packet;
    GridPoint extent;
    GridPoint location;
    
    packet = [ROVTestPacket new];
    extent.x = 4;
    extent.y = 4;
    packet.gridExtent = extent;
    location.x = 0;
    location.y = 0;
    packet.roverStartPoint = location;
    packet.roverStartDirection = [ROVCardinalDirection directionFromChar: 'N'];
    packet.commandSequence = [ROVCommand commandSequenceFromString: @"MMMMRMMMMRMMMMRMMMMR"];
    return(packet);
    }

@end
