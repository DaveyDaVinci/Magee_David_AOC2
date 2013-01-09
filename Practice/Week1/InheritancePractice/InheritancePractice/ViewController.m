//
//  ViewController.m
//  InheritancePractice
//
//  Created by David Magee on 1/8/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import "ViewController.h"
#import "Shape.h"
#import "Triangle.h"
#import "Square.h" //imported all headers

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    Triangle *triangle = [[Triangle alloc] init]; //This calls and inits the triangle class
    if (triangle != nil)
    {
        [triangle setNumOfSides]; //Sets the values for numOfSides and nameOFShape
        [triangle printNumSides]; //Calls the print method from the Shape class
    }
    
    Square *square = [[Square alloc] init]; //This calls and inits the square class
    if (square != nil)
    {
        [square setNumOfSides]; //Sets the values for numOfSides and nameOfShape
        [square printNumSides]; //Calls the print method from the Shape class
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
