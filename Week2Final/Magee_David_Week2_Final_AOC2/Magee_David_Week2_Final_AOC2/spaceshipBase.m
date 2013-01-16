//
//  spaceshipBase.m
//  Magee_David_Week2_Final_AOC2
//
//  Created by David Magee on 1/16/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import "spaceshipBase.h"

@implementation spaceshipBase


//Gets and sets the properties declared in the header
@synthesize nameOfShip, howFastShipTravels, numOfEngines, weight, speed;


-(id)init
{
    self = [super init];
    if (self != nil)
    {
        [self setNameOfShip:nil];
        [self setNumOfEngines:0];
        [self setHowFastShipTravels:0];
        
    }
    return self;
}

//Method used to calculate the ship's speed
-(void)calculateShipSpeed
{
    
    [self setHowFastShipTravels:weight - speed];
    
}

@end
