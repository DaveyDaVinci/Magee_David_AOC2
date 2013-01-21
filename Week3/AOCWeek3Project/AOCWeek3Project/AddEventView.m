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
        
        //Dismisses current view 
        [self dismissViewControllerAnimated:true completion:nil];
    
    //Second part of the if statement
    } else if (tag == 1) {
        
        //Resigns from first responder, which removes it from the top of the stack, pretty much, so the keyboard dismisses
        [eventField resignFirstResponder];
    }
}


//Picker view function
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"code here");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
