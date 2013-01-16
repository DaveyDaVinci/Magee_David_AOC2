//
//  destroyerShip.m
//  Magee_David_Week2_Final_AOC2
//
//  Created by David Magee on 1/16/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import "destroyerShip.h"

@implementation destroyerShip

//Gets and sets the int property declared in the header
@synthesize numberOfMissiles, destroyedShips, speed, weight;


-(id)init //sets init method
{
    
    self = [super init];
    if (self != nil)
    {
        [self setNumberOfMissiles:25]; //sets number of missiles
        [self setDestroyedShips:5]; //sets destroyed ships
        [self setSpeed:700];   //sets speed
        [self setNameOfShip:@"Daria"];
        [self setNumOfEngines:3];
    }
    return self;
}

-(void)calculateShipSpeed
{
    [self setHowFastShipTravels:(destroyedShips * speed)]; //Calculates ship speed
}




@end
