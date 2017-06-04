//
//  ROVCommandPacket.m
//  Curiosity
//
//  Created by Vincent Coetzee on 2017/06/04.
//  Copyright © 2017 Vincent Coetzee. All rights reserved.
//

#import "ROVTransmittedPacket.h"
#import "Rover.h"

#define VALID_COMMAND_CHARACTERS (@"MRL")
#define MAXIMUM_SEQUENCE_LENGTH (1023)

@implementation ROVTransmittedPacket

+ (instancetype) newFromFileAtPath: (NSString*) path
    {
    return([[self new] initFromFileAtPath: path]);
    }

- (instancetype) initFromFileAtPath: (NSString*) path
    {
    self = [super init];
    if (self)
        {
        [self readFromFileAtPath: path];
        }
    return(self);
    }

- (void) readFromFileAtPath: (NSString*) path
    {
    FILE* stream;
    NSInteger gridExtentX = -1;
    NSInteger gridExtentY = -1;
    NSInteger startLocationX = -1;
    NSInteger startLocationY = -1;
    char direction[64] = "";
    char sequence[MAXIMUM_SEQUENCE_LENGTH] = "";
    ROVCardinalDirection* aDirection;
    NSString* aSequence;
    char format[64];
    
    if ((stream = fopen([path UTF8String],"rt")) == NULL)
        {
        [NSException raise: @"Rover" format: @"Error %s opening file %s",strerror(errno),[path UTF8String]];
        }
    fscanf(stream,"%ld %ld\n",&gridExtentX,&gridExtentY);
    fscanf(stream,"%ld %ld %1s\n",&startLocationX,&startLocationY,direction);
    sprintf(format,"%%%ds",MAXIMUM_SEQUENCE_LENGTH);
    fscanf(stream,format,sequence);
    fclose(stream);
    if (gridExtentX == -1 || gridExtentY == -1)
        {
        [NSException raise: @"Rover" format: @"Invalid grid origin"];
        }
    if (startLocationX == -1 || startLocationY == -1 || strlen(direction) == 0)
        {
        [NSException raise: @"Rover" format: @"Invalid start location"];
        }
    if (strlen(sequence) == 0)
        {
        [NSException raise: @"Rover" format: @"Invalid command sequence"];
        }
    aSequence = [NSString stringWithUTF8String: sequence];
    [self validateCommandSequence: aSequence];
    aDirection = [ROVCardinalDirection directionFromChar: direction[0]];
    if (aDirection == nil)
        {
        [NSException raise: @"Rover" format: @"Invalid starting direction"];
        }
    _gridExtent.x = gridExtentX;
    _gridExtent.y = gridExtentY;
    _roverStartDirection = aDirection;
    _roverStartPoint.x = startLocationX;
    _roverStartPoint.y = startLocationY;
    _commandSequence = [ROVCommand commandSequenceFromString: aSequence];
    }

- (void) validateCommandSequence: (NSString*) sequence
    {
    NSRegularExpression* expression;
    NSError* error = nil;
    NSTextCheckingResult* match;
    
    expression = [NSRegularExpression regularExpressionWithPattern: @"[MLR]+" options: 0 error: &error];
    if (error != nil)
        {
        [NSException raise: @"Rover" format: @"Invalid regex in validateCommandSequence"];
        }
    match = [expression firstMatchInString: sequence options: 0 range: NSMakeRange(0,[sequence length])];
    if (!match)
        {
        [NSException raise: @"Rover" format: @"Command sequence contains invalid commands"];
        }
    }

@end
