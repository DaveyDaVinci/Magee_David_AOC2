//
//  Shape.m
//  InheritancePractice
//
//  Created by David Magee on 1/8/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//


#import "Shape.h"
#import "Triangle.h"
#import "Square.h"
 

@implementation Shape
-(void)printNumSides //Sets a method that nslogs number of sides
{
    NSLog(@"A %@ has %d sides", nameOfShape, numOfSides); //NSLogs number of sides and shape name
}

@end
