//
//  AddEventView.m
//  AOCWeek3Project
//
//  Created by David Magee on 1/20/13.
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
    if (tag == 0) {
        
        //Sets up requirement for text input on user side
        if ([eventField.text isEqualToString:@"Type Event Here..."])
        {
            //Initializes an alert view if the user didn't input any information.  
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"More Info Needed" message:@"Please input event info" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            if (alertView != nil)
            {
                [alertView show];
            }
            
        } else {
        
            //Sets the text in the field as a variable
        savedEvent = eventField.text;
 
            if (delegate != nil)
            {
                //Creates an instance of a formatter
                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                if (dateFormatter != nil)
                {
                    //Sets date format
                    [dateFormatter setDateFormat:@"yyyy.MM.dd"];
                
                    //sets date as a variable
                    formattedDate = [dateFormatter stringFromDate:savedDate];
                    NSLog(@"%@", formattedDate);
                
                }

            
                //Saves text to global variable
                NSLog(@"%@ %@", savedEvent, [savedDate description]);
            
                //Sets the text in the field as the text from the field
                [delegate ReturnEvent:savedEvent ReturnDate:formattedDate];
            
            }
 
        
        //Dismisses current view 
        [self dismissViewControllerAnimated:true completion:nil];
        }
        
        
            
    //Second part of the if statement
    } else if (tag == 1) {
        
        //Resigns from first responder, which removes it from the top of the stack, pretty much, so the keyboard dismisses
        [eventField resignFirstResponder];
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
        
        //Grabs the data and logs it
        //NSLog(@"date = %@", [savedDate description]);
    }
}


//Accesses delegate for a did begin typing function
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    //Sets the text to nothing as you type
    textField.text = [NSString stringWithFormat:@""];
}







- (void)viewDidLoad
{
    
    //Sets minimum date for date picker,
    NSDate *currentDate = [NSDate date];
    datePicker.minimumDate = currentDate;
    
    
    //Uses the default date so if no date is manually entered, value does not return null
    savedDate = [NSDate date];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
