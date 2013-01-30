//
//  AddEventView.h
//  MageeDavidAOC2Week4
//
//  Created by David Magee on 1/23/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import <UIKit/UIKit.h>

//Sets up a custom delegate to move information from the top view to the base view
@protocol AddEventViewDelegate <NSObject>

//FUnction to determine if view closed
@required
-(void)ReturnEvent:(NSString*)nameString ReturnDate:(NSString*)returnDate;

@end

@interface AddEventView : UIViewController <UIPickerViewDelegate, UITextFieldDelegate>
{
    //Sets up outlets for UI items
    IBOutlet UIButton *homeButton;
    IBOutlet UIButton *saveButton;
    IBOutlet UIButton *closeKeyboard;
    IBOutlet UIDatePicker *datePicker;
    IBOutlet UITextField *eventField;
    IBOutlet UILabel *leftSwipeLabel;
    IBOutlet UILabel *pickerSwipeLabel;
    IBOutlet UIView *pickerView;
    IBOutlet UIView *mainView;
    
    
    //Sets up the delegate as a variable
    id<AddEventViewDelegate> delegate;
    
    NSDate *savedDate;
    NSString *savedEvent;
    NSString *formattedDate;

    UISwipeGestureRecognizer *leftSwiper;
    UITapGestureRecognizer *tapper;
    
}

//Save button function
-(IBAction)saveOnClickOrClose:(id)sender;

//Collect data from picker function
-(IBAction)collectFromPicker:(id)sender;


//Created method for the swipe gesture recognizer
-(void)onLeft:(UISwipeGestureRecognizer *)left;

//-(void)onTap:(UITapGestureRecognizer *)tap;


//Allows to set delegate from outside
@property (strong) id<AddEventViewDelegate> delegate;

@end
