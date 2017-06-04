//
//  main.m
//  Curiosity
//
//  Created by Vincent Coetzee on 2017/06/04.
//  Copyright © 2017 Vincent Coetzee. All rights reserved.
//

#import "Rover.h"
#import "ROVTransmittedPacket.h"
#import "ROVRover.h"

//
// Local function prototypes, declared here because they are never used anywhere else
//

void printUsage();
BOOL fileAtPathExistsAndIsReadable(NSString* path);

//
// Main logic, read a command packet, if successful, create and rover and
// and ask it to execute the packet
//

int main(int argc, const char * argv[])
    {
    ROVTransmittedPacket* packet;
    NSString* path;
    ROVRover* rover;
    
    @autoreleasepool
        {
        if (argc != 2)
            {
            printUsage();
            exit(1);
            }
        else
            {
            path = [NSString stringWithUTF8String: argv[1]];
            @try
                {
                if (fileAtPathExistsAndIsReadable(path))
                    {
                    packet = [ROVTransmittedPacket newFromFileAtPath: path];
                    rover = [ROVRover new];
                    [rover executeCommandPacket: packet];
                    [rover printLocation];
                    }
                else
                    {
                    printf("The file at path \"%s\" does not exist or is not readable\n",[path UTF8String]);
                    }
                    
                }
            @catch(NSException* exception)
                {
                printf("Fatal error %s",[[exception reason] UTF8String]);
                }
            }
        }
    return 0;
    }

void printUsage()
    {
    printf("usage: curiosity [ path-to-input-file | test ]\n");
    printf("\tYou must pass an argument to curiosity\n");
    printf("\tThe argument must be a path ( relative or absolute ) to the file containing the command packet\n");
    printf("\t or the argument must be the word test to test the rover\n");
    }

BOOL fileAtPathExistsAndIsReadable(NSString* path)
    {
    NSFileManager* fileManager;
    
    fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath: path])
        {
        return(NO);
        }
    if (![fileManager isReadableFileAtPath: path])
        {
        return(NO);
        }
    return(YES);
    }
