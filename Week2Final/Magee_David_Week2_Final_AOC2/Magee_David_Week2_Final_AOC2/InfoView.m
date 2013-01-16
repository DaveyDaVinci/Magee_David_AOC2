//
//  InfoView.m
//  Magee_David_Week2_Final_AOC2
//
//  Created by David Magee on 1/16/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import "InfoView.h"

@interface InfoView ()

@end

@implementation InfoView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)goHome:(id)sender //GO home function
{
    [self dismissViewControllerAnimated:true completion:nil]; //Sets the view back to the home screen by dismissing current view
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
