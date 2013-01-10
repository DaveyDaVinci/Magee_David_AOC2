//
//  shipFactory.h
//  MageeDavidWeek1AOC2
//
//  Created by David Magee on 1/10/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "spaceshipBase.h"
#import "cargoShip.h"
#import "destroyerShip.h"
#import "bountyShip.h"
//Imports all other classes into the factory header

@interface shipFactory : NSObject

//Creates a static method based on the base class, passes in an int argument
+(spaceshipBase *)createNewShip: (int)shipType;

@end
