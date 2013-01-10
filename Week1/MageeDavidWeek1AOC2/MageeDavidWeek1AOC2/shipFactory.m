//
//  shipFactory.m
//  MageeDavidWeek1AOC2
//
//  Created by David Magee on 1/10/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import "shipFactory.h"

@implementation shipFactory

//Creates a static method based on the base class, passes in an int argument
+(spaceshipBase *)createNewShip: (int)shipType
{
    if (shipType == CARGO)
    {
        return [[cargoShip alloc] init];
    } else if (shipType == DESTROYER)
    {
        return [[destroyerShip alloc] init];
    } else if (shipType == BOUNTY)
    {
        return [[bountyShip alloc] init];
    } else return nil;
}

@end
