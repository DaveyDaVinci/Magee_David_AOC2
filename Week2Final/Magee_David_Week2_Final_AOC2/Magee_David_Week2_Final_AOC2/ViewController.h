//
//  ViewController.h
//  Magee_David_Week2_Final_AOC2
//
//  Created by David Magee on 1/16/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "shipFactory.h"
#import "InfoView.h"

@interface ViewController : UIViewController

{ //Calls labesl so they can be used
    IBOutlet UISegmentedControl * defaultColor;//outlet for segment buttons
    IBOutlet UIButton * cargoButton;
    IBOutlet UIButton * destroyerButton;
    IBOutlet UIButton * bountyButton;
    IBOutlet UILabel * mainLabel;
    IBOutlet UIStepper * multiplier;
    IBOutlet UIButton * calculator;
    IBOutlet UILabel *multiplierLabel;
    IBOutlet UILabel    *   bgLabel;
    
}

-(IBAction)infoButton:(id)sender; //Info button method, changes screen.
-(IBAction)colorChanger:(id)sender; //Background Color Segment method.
-(IBAction)destroyerFunction:(id)sender; //BUttons for ship changer.
-(IBAction)cargoFunction:(id)sender;//Button for cargo ship
-(IBAction)bountyFunction:(id)sender;
-(IBAction)calculateSpeedWithMultiplier:(id)sender;
-(IBAction)multiplierFunction:(id)sender;



@end
