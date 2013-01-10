//
//  destroyerShip.m
//  MageeDavidWeek1AOC2
//
//  Created by David Magee on 1/10/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import "destroyerShip.h"

@implementation destroyerShip


//Gets and sets the int property declared in the header
@synthesize numberOfMissiles, destroyedShips, speed;


-(id)init //sets init method
{
    
    self = [super init];
    if (self != nil)
    {
        [self setNumberOfMissiles:25]; //sets number of missiles
        [self setDestroyedShips:5]; //sets destroyed ships
        [self setSpeed:700];   //sets speed
    }
    return self;
}

-(void)calculateShipSpeed
{
    [self setHowFastShipTravels:(destroyedShips * speed)]; //Calculates ship speed
    NSLog(@"The destroyer ship flies at %i mph", self.howFastShipTravels); //use the . syntax to access the data
    
}



@end
