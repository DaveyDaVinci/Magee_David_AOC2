//
//  spaceshipBase.h
//  MageeDavidWeek1AOC2
//
//  Created by David Magee on 1/10/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface spaceshipBase : NSObject
{
    int shipEnum; //Declares enum as an integer
}

//Sets up a numerical list to sort through
typedef enum {
    CARGO,
    DESTROYER,
    BOUNTY

} shipEnum; //name of the enum


//These are shared by all ships, makes it easy to get and set using synthesize
@property NSString *nameOfShip;
@property int numOfEngines;
@property int howFastShipTravels;
@property int weight;
@property int speed;

//Initializes the class
-(id)init;


//Method used to calculate the ship's speed
-(void)calculateShipSpeed;





@end
