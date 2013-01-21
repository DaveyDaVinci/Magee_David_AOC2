//
//  AddEventView.h
//  AOCWeek3Project
//
//  Created by David Magee on 1/20/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEventView : UIViewController <UIPickerViewDelegate>
{
    //Sets up outlets for UI items
    IBOutlet UIButton *saveButton;
    IBOutlet UIButton *closeKeyboard;
    IBOutlet UIDatePicker *datePicker;
    IBOutlet UITextField *eventField;
}

//Save button function
-(IBAction)saveOnClickOrClose:(id)sender;

//Collect data from picker function
-(IBAction)collectFromPicker:(id)sender;

@end
