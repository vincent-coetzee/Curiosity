//
//  TestSuite.m
//  TestSuite
//
//  Created by Vincent Coetzee on 2017/06/04.
//  Copyright © 2017 Vincent Coetzee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Rover.h"
#import "ROVRover.h"
#import "ROVTestPacket.h"
#import "ROVCardinalDirection.h"

@interface TestSuite : XCTestCase

@end

@implementation TestSuite

- (void)setUp
    {
    [super setUp];
    }

- (void)tearDown
    {
    [super tearDown];
    }

- (void)testCardinalDirections
    {
    ROVCardinalDirection* direction;
    
    direction = [ROVCardinalDirection directionFromChar: 'N'];
    XCTAssertTrue([direction isNorth]);
    direction = [direction rotatedLeft];
    XCTAssertTrue([direction isWest]);
    direction = [direction rotatedLeft];
    XCTAssertTrue([direction isSouth]);
    direction = [direction rotatedLeft];
    XCTAssertTrue([direction isEast]);
    direction = [direction rotatedLeft];
    XCTAssertTrue([direction isNorth]);
    direction = [direction rotatedRight];
    XCTAssertTrue([direction isEast]);
    direction = [direction rotatedRight];
    XCTAssertTrue([direction isSouth]);
    direction = [direction rotatedRight];
    XCTAssertTrue([direction isWest]);
    direction = [direction rotatedRight];
    XCTAssertTrue([direction isNorth]);
    }

- (void) testUpAndDown
    {
    ROVTestPacket* packet;
    ROVRover* rover;
    
    packet = [ROVTestPacket upAndDownTest];
    rover = [ROVRover new];
    [rover executeCommandPacket: packet];
    XCTAssertEqual(rover.currentLocation.x,packet.roverStartPoint.x);
    XCTAssertEqual(rover.currentLocation.y,packet.roverStartPoint.y);
    XCTAssertEqualObjects(rover.currentDirection.displayString,packet.roverStartDirection.displayString);
    }

- (void) testBackAndForth
    {
    ROVTestPacket* packet;
    ROVRover* rover;
    
    packet = [ROVTestPacket backAndForthTest];
    rover = [ROVRover new];
    [rover executeCommandPacket: packet];
    XCTAssertEqual(rover.currentLocation.x,packet.roverStartPoint.x);
    XCTAssertEqual(rover.currentLocation.y,packet.roverStartPoint.y);
    XCTAssertEqualObjects(rover.currentDirection.displayString,packet.roverStartDirection.displayString);
    }

- (void) testSkirtEdge
    {
    ROVTestPacket* packet;
    ROVRover* rover;
    
    packet = [ROVTestPacket skirtEdgeTest];
    rover = [ROVRover new];
    [rover executeCommandPacket: packet];
    XCTAssertEqual(rover.currentLocation.x,packet.roverStartPoint.x);
    XCTAssertEqual(rover.currentLocation.y,packet.roverStartPoint.y);
    XCTAssertEqualObjects(rover.currentDirection.displayString,packet.roverStartDirection.displayString);
    }
@end
