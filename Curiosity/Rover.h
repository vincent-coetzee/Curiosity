//
//  Rover.h
//  Curiosity
//
//  Created by Vincent Coetzee on 2017/06/04.
//  Copyright © 2017 Vincent Coetzee. All rights reserved.
//

#ifndef Rover_h
#define Rover_h

#import <Foundation/Foundation.h>

//
// Define a struct to hold a grid location, we do
// this as struct to ensure value semantics
//

typedef struct _GridPoint
    {
    NSInteger x;
    NSInteger y;
    }
    GridPoint;
    
#endif /* Rover_h */
