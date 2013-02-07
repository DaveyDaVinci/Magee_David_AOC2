//
//  ViewController.m
//  MDF1Week1Project
//
//  Created by David Magee on 2/6/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "SelectedCellView.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)buttonClick:(id)sender
{
    if (theSwitch)
    {
    [theTable setEditing:true];
    theSwitch = false;
    
    } else
    {
        [theTable setEditing:false];
        theSwitch = true;
    }
    
}


- (void)viewDidLoad
{
    theSwitch = true;
    
    firstArray = [[NSMutableArray alloc] initWithObjects:@"Mercury", @"Venus", @"Earth", @"Mars", @"Jupiter", @"Saturn", @"Uranus", @"Neptune", @"Pluto", @"Unnamed Planet 1", @"Unnamed Planet 2", @"Unnamed Planet 3", @"Unnamed Planet 4", @"Unnamed Planet 5", @"Unnamed Planet 6", @"Unnamed Planet 7", @"Unnamed Planet 8", @"Unnamed Planet 9", @"Unnamed Planet 10", @"Unnamed Planet 11", @"Unnamed Planet 12", nil];
    
    secondArray = [[NSMutableArray alloc] initWithObjects:@"0", @"0", @"1", @"2", @"67", @"62", @"27", @"13", @"5", @"4", @"45", @"12", @"0", @"3", @"5", @"34", @"2", @"1", @"0", @"56", @"75", nil];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%d", [firstArray count]);
    NSLog(@"%d", [secondArray count]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITable View Data Source Methods


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifierString = @"Cell";
    
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierString];
    
    if (cell == nil)
    {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierString];
        
        NSArray *differentCells = [[NSBundle mainBundle] loadNibNamed:@"CustomCellView" owner:nil options:nil];
        
        for (UIView *view in differentCells)
        {
            if ([view isKindOfClass:[CustomCell class]])
            {
                cell = (CustomCell*)view;
                
                
            }
        }
    }
    
    cell.planetLabel2.text = [firstArray objectAtIndex:indexPath.row];
    cell.moonLabel2.text = [NSString stringWithFormat:@"Number of Moons: %@", [secondArray objectAtIndex:indexPath.row]];

    
    return cell;
    
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [firstArray count];
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [firstArray removeObjectAtIndex:indexPath.row];
    [secondArray removeObjectAtIndex:indexPath.row];
    
    [theTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation: true];
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"derp");
    SelectedCellView *selectedCellView = [[SelectedCellView alloc] initWithNibName:@"SelectedCellView" bundle:nil];
    
    [self presentViewController:selectedCellView animated:TRUE completion:nil];
}


@end
