//
//  ViewController.h
//  MDF1Week1Project
//
//  Created by David Magee on 2/6/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
#import "SelectedCellView.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *theTable;
    IBOutlet UIButton *editButton;
    NSMutableArray *firstArray;
    NSMutableArray *secondArray;
    BOOL theSwitch;
    

}
-(IBAction)buttonClick:(id)sender;

@end
