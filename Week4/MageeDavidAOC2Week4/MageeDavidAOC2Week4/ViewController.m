//
//  ViewController.m
//  MageeDavidAOC2Week4
//
//  Created by David Magee on 1/23/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    //Creats another instance of User Defaults
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (userDefaults != nil)
    {
        //Creats a string from the data stored in NSUserDefaults
        NSString *savedEvents = [userDefaults objectForKey:@"events"];
        
        //Sets the text in the box to the saved events
        eventView.text = savedEvents;
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)ReturnEvent:(NSString *)nameString ReturnDate:(NSString *)returnDate
{
    //Concantenates two strings into one
    
    thestring = [NSString stringWithFormat:@"\n %@ on %@", nameString, returnDate];
    
    //Runs a conditional to see if the default text is still there
    if ( [eventView.text isEqualToString:@"No Events Added" ] || [eventView.text length] == 0 )
    {
        //If passes, then text is changed
        eventView.text = [NSString stringWithFormat:@" %@ on %@", nameString, returnDate];
        
                
    } else {
        
        secondString = [eventView.text stringByAppendingString:thestring];
        
        //If fails, text is appended
        eventView.text = [eventView.text stringByAppendingString:thestring];
        
                
    }
    
        
}


//Save button method
-(IBAction)addOnClick:(id)sender
{
    //Set so it doesn't run if secondString is nil, which caused crashing
    if (secondString != nil)
    {
        
        //Creates an instance of NSUserDefaults
        NSUserDefaults *savedEvents = [NSUserDefaults standardUserDefaults];
        if (savedEvents != nil)
        {
            //Creates a string that contains the formatted string from the other view
            NSString *savedInfo = [NSString stringWithString:secondString];
            
            ////Sets an object in the NSUserDefaults and sets a key for it to be called later
            [savedEvents setObject:savedInfo forKey:@"events"];
        
            //applies the changes to the NSUserDefaults
            [savedEvents synchronize];
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Saved" message:@"The world has been saved!  And by world, I mean your plans..." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
        
        }
    }
   
}



-(void)viewWillAppear:(BOOL)animated
{
    //Allocates the right swiper, and creates the selector method above
    rightSwiper = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onRight:)];
    //Sets the direction for the right swiper
    rightSwiper.direction = UISwipeGestureRecognizerDirectionRight;
    //attaches the swiper to the label
    [swipeLabel addGestureRecognizer:rightSwiper];
    
    
    /* Left swiper gesture recognizers are commented out for reference.
    //Allocates the left swiper, and creates the selector method above
    leftSwiper = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onLeft:)];
    //Sets the direction for the left swiper
    leftSwiper.direction = UISwipeGestureRecognizerDirectionLeft;
    //Attaches the swiper to the label 
    [swipeLabel addGestureRecognizer:leftSwiper];
     */
    
    [super viewWillAppear:animated];
}



//Creates the onRight: function
-(void)onRight:(UISwipeGestureRecognizer *)right
{
    
    //Creates the second view, allocs memory, inits with the name.
    AddEventView *secondView = [[AddEventView alloc] initWithNibName:@"AddEventView" bundle:nil];
    if (secondView != nil) //Allocates second view, inits from the xib file
    {
        //Sets the delegate as its self
        secondView.delegate = self ;
        //Presents the second view controller
        [self presentViewController:secondView animated:true completion:nil]; //Brings up the second view
    }
    
}



/* Used to delete the information on a left swipe.  Leaving in code for reference. 
//Creates the onLeft: function
-(void)onLeft:(UISwipeGestureRecognizer *)left
{
    //Creates a new instance of NSUserDefaults
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (userDefaults != nil)
    {
        //Removes any text saved in the key Events in userDefaults
        [userDefaults removeObjectForKey:@"events"];
        
        //Sets the text to say that the events were cleared
        eventView.text = [NSString stringWithFormat:@"Events Cleared"];
        
        //Commits changes to the userDefaults
        [userDefaults synchronize];

    }
}
*/


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

