//
//  SelectedCellView.h
//  MDF1Week1Project
//
//  Created by David Magee on 2/6/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface SelectedCellView : UIViewController 
{
    
}

-(IBAction)onClick:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@end
