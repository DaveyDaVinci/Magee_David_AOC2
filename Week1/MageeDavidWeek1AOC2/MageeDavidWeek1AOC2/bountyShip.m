//
//  bountyShip.m
//  MageeDavidWeek1AOC2
//
//  Created by David Magee on 1/10/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import "bountyShip.h"

@implementation bountyShip


//Gets and sets the int property declared in the header
@synthesize numberOfPrisoners, speed;


-(id)init //sets init method
{
    
    self = [super init];
    if (self != nil)
    {
        [self setNumberOfPrisoners:75]; //sets number of prisoners
        [self setSpeed:500];   //sets speed
    }
    return self;
}

-(void)calculateShipSpeed
{
    [self setHowFastShipTravels:(speed  / numberOfPrisoners)]; //Calculates ship speed
    NSLog(@"The bounty ship flies at %i mph", self.howFastShipTravels); //use the . syntax to access the data
    
}



@end
