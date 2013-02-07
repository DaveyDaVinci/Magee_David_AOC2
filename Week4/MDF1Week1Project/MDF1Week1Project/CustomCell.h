//
//  CustomCell.h
//  MDF1Week1Project
//
//  Created by David Magee on 2/6/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
{
    IBOutlet UILabel *planetLabel;
    IBOutlet UILabel *moonLabel;
}

@property (strong, nonatomic) IBOutlet UILabel *planetLabel2;
@property (strong, nonatomic) IBOutlet UILabel *moonLabel2;

@end
