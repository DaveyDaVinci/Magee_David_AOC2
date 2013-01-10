//
//  cargoShip.m
//  MageeDavidWeek1AOC2
//
//  Created by David Magee on 1/10/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import "cargoShip.h"

@implementation cargoShip

//Gets and sets the int property declared in the header
@synthesize poundsOfCargo, weight, speed;

-(id)init //sets init method
{

    self = [super init];
    if (self != nil)
    {
        [self setPoundsOfCargo:25]; //sets pounds of cargo
        [self setWeight:1000]; //sets weight
        [self setSpeed:500];   //sets speed
        [self setNameOfShip:@"Cassia"];
        [self setNumOfEngines:4];
    }
    return self;
}

-(void)calculateShipSpeed
{
    [self setHowFastShipTravels:(speed - poundsOfCargo)]; //Calculates ship speed
    
}

@end
