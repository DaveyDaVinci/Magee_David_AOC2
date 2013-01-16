//
//  bountyShip.m
//  Magee_David_Week2_Final_AOC2
//
//  Created by David Magee on 1/16/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import "bountyShip.h"

@implementation bountyShip


//Gets and sets the int property declared in the header
@synthesize numberOfPrisoners, speed, weight;


-(id)init //sets init method
{
    
    self = [super init];
    if (self != nil)
    {
        [self setNumberOfPrisoners:75]; //sets number of prisoners
        [self setSpeed:500];   //sets speed
        [self setNameOfShip:@"Merdock"];
        [self setNumOfEngines:4];
    }
    return self;
}

-(void)calculateShipSpeed
{
    [self setHowFastShipTravels:(speed  / numberOfPrisoners)]; //Calculates ship speed
    
}




@end
