//
//  AddEventView.m
//  MageeDavidAOC2Week4
//
//  Created by David Magee on 1/23/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import "AddEventView.h"

@interface AddEventView ()

@end



@implementation AddEventView

@synthesize delegate;

//Initializes the view
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}






//function for button presses
- (IBAction)saveOnClickOrClose:(id)sender
{
    //Sets the tag of the button as a var.
    NSInteger tag = [sender tag];
    
    //Runs an if statement to check button tag
            //Second part of the if statement
    if (tag == 1) {
        
        //Resigns from first responder, which removes it from the top of the stack, pretty much, so the keyboard dismisses
        [eventField resignFirstResponder];
        
        
        //Tag for the close window option
    }
}







//Gathers data from picker
-(IBAction)collectFromPicker:(id)sender
{
    
    //Sets up a new instance of the date picker for this function, and points back to sender for information
    UIDatePicker *picker = (UIDatePicker*) sender;
    if (picker != nil)
    {
        //Formats a date variable
        savedDate = picker.date;
        
    }
}


//Accesses delegate for a did begin typing function
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    //Sets the text to nothing as you type
    textField.text = [NSString stringWithFormat:@""];
}



//Function for left swiper
-(void)onLeft:(UISwipeGestureRecognizer *)left
{
   //Saves the textfield to the global variable savedEvent
    savedEvent = eventField.text;
    
    if ([eventField.text isEqualToString:@"Type Event Here..."] || [eventField.text length] == 0)
    {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"More Info Needed" message:@"Please input event info" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        if (alertView != nil)
        {
            [alertView show];
        }

    
    } else {
    
        if (delegate != nil)
        {

            //Creates an instance of a formatter
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            if (dateFormatter != nil)
            {
                //Sets date format
                [dateFormatter setDateFormat:@"EEE, MMM d, ''yy 'at' h:mm a"];
            
            
                //sets date as a variable
                formattedDate = [dateFormatter stringFromDate:savedDate];
            }
        
                
            //Sets the text in the field as the text from the field
            [delegate ReturnEvent:savedEvent ReturnDate:formattedDate];
        
        }
    
        //Dismisses current view
        [self dismissViewControllerAnimated:true completion:nil];
        }
    

}


//Sets a tap option to bring down the picker
-(void)onTap:(UITapGestureRecognizer *)tap
{
    if ([eventField isFirstResponder])
    {
        [eventField resignFirstResponder];
    }
    //Adds the subview to the main view
    [mainView addSubview:pickerView];
    
    //Begins animaTion
    [UIView beginAnimations:nil context:NULL];
    
    //Sets how it animates in 
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    //Makes the frame
    pickerView.frame   = CGRectMake(0, 200, 320, 216);
    
    //Commits view
    [UIView commitAnimations];
}


- (void)viewDidLoad
{
    
    //ALlocates the swipe gesture recognizer and inits with custom method
    leftSwiper = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onLeft:)];
    
    //Sets the direction of the swiper
    leftSwiper.direction = UISwipeGestureRecognizerDirectionLeft;
    
    //Adds the swipe recognizer to the label
    [leftSwipeLabel addGestureRecognizer:leftSwiper];
    
    
    //Sets minimum date for date picker,
    NSDate *currentDate = [NSDate date];
    datePicker.minimumDate = currentDate;
    
    
    //Uses the default date so if no date is manually entered, value does not return null
    savedDate = [NSDate date];
    
    
    //Allocs the gesture recognizer
    tapper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    if (tapper != nil)
    {
        tapper.numberOfTapsRequired = 1;
        [pickerSwipeLabel addGestureRecognizer:tapper];
    }
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
