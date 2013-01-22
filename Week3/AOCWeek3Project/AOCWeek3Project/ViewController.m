//
//  ViewController.m
//  AOCWeek3Project
//
//  Created by David Magee on 1/20/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)ReturnEvent:(NSString *)nameString ReturnDate:(NSString *)returnDate 
{
    //Concantenates two strings into one 
    NSString *thestring = [NSString stringWithFormat:@"\n\n %@ on %@", nameString, returnDate];
    
    //Runs a conditional to see if the default text is still there
    if ( [eventView.text isEqualToString:@"No Events Added"] )
    {
        //If passes, then text is changed
        eventView.text = [NSString stringWithFormat:@" %@ on %@", nameString, returnDate];
    } else {
    
    //If fails, text is appened
    eventView.text = [eventView.text stringByAppendingString:thestring];
        
    }
    
}

//GO to add view on click function
-(IBAction)addOnClick:(id)sender
{
    
        
    //Creates the second view, allocs memory, inits with the name.
    AddEventView *secondView = [[AddEventView alloc] initWithNibName:@"AddEventView" bundle:nil];
    if (secondView != nil) //Allocates second view, inits from the xib file
    {
        secondView.delegate = self ;
        //Presents the second view controller
        [self presentViewController:secondView animated:true completion:nil]; //Brings up the second view
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
