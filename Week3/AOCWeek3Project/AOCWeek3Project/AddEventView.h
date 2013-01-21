//
//  AddEventView.h
//  AOCWeek3Project
//
//  Created by David Magee on 1/20/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import <UIKit/UIKit.h>

//Sets up a custom delegate to move information from the top view to the base view
@protocol AddEventViewDelegate <NSObject>

//FUnction to determine if view closed
@required
-(void)DidClose:(NSString*)nameString;

@end

@interface AddEventView : UIViewController <UIPickerViewDelegate, UITextFieldDelegate>
{
    //Sets up outlets for UI items
    IBOutlet UIButton *saveButton;
    IBOutlet UIButton *closeKeyboard;
    IBOutlet UIDatePicker *datePicker;
    IBOutlet UITextField *eventField;
    
    //Sets up the delegate as a variable
    id<AddEventViewDelegate> delegate;
    
    NSDate *savedDate;
    NSString *savedEvent;
}

//Save button function
-(IBAction)saveOnClickOrClose:(id)sender;

//Collect data from picker function
-(IBAction)collectFromPicker:(id)sender;


//Allows to set delegate from outside
@property (strong) id<AddEventViewDelegate> delegate;

@end

