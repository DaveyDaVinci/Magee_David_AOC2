//
//  Shape.h
//  InheritancePractice
//
//  Created by David Magee on 1/8/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import <Foundation/Foundation.h>




//Created the base object of SHape, which sets an int value called numOfSides
@interface Shape : NSObject

{
    @protected //Is protected
    int numOfSides; //Sets the int name to numOfSides that the other classes draw from
}
-(void)printNumSides;

@end
