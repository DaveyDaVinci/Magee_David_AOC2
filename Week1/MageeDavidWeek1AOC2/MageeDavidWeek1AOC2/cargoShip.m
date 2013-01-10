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
        [self setPoundsOfCargo:50]; //sets pounds of cargo
        [self setWeight:1000]; //sets weight
        [self setSpeed:500];   //sets speed
    }
    return self;
}

-(void)calculateShipSpeed
{
    [self setHowFastShipTravels:(weight - speed)]; //Calculates ship speed
    NSLog(@"The cargo ship flies at %i mph", self.howFastShipTravels); //use the . syntax to access the data 
    
}

@end
