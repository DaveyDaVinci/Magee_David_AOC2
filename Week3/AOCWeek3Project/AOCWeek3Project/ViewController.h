//
//  ViewController.h
//  AOCWeek3Project
//
//  Created by David Magee on 1/20/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddEventView.h"    

@interface ViewController : UIViewController <AddEventViewDelegate> 

{
    //Outlets for UI elements
    IBOutlet UITextView *eventView;
    IBOutlet UIButton *addButton;
}

//add event button
-(IBAction)addOnClick:(id)sender;

@end
