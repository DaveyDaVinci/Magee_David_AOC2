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
        
        //Check to make sure text is being gathered.  It is. 
        NSString *text = eventField.text;
        NSLog(@"%@", text);
        
        
        if (delegate != nil)
        {
            
            //Saves text to global variable
            savedEvent = text;
            NSLog(@"%@ %@", savedEvent, [savedDate description]);
            
            //Sets the text in the field as the text from the field
            [delegate DidClose:eventField.text];
            
        }
 
        
        //Dismisses current view 
        [self dismissViewControllerAnimated:true completion:nil];
        
        
            
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
        NSLog(@"date = %@", [savedDate description]);
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
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
