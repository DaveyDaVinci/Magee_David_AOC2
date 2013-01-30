//
//  ViewController.h
//  MageeDavidAOC2Week4
//
//  Created by David Magee on 1/23/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddEventView.h"

@interface ViewController : UIViewController <AddEventViewDelegate>

{
    //Outlets for UI elements
    IBOutlet UITextView *eventView;
    IBOutlet UIButton *addButton;
    IBOutlet UILabel *swipeLabel;
    UISwipeGestureRecognizer *rightSwiper;
    UISwipeGestureRecognizer *leftSwiper;
    NSString *thestring;
    NSString *secondString;
}

-(void)onRight:(UISwipeGestureRecognizer *)right;


//-(void)onLeft:(UISwipeGestureRecognizer *)left;

//add event button
-(IBAction)addOnClick:(id)sender;

@end
