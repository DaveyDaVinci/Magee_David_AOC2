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
#import "Square.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    Triangle *triangle = [[Triangle alloc] init];
    if (triangle != nil)
    {
        [triangle printNumSides];
    }
    
    Square *square = [[Square alloc] init];
    if (square != nil)
    {
        [square printNumSides];
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
