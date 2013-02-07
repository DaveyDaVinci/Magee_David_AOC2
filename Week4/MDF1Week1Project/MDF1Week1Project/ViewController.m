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


//This fires when the edit button is selected
-(IBAction)buttonClick:(id)sender
{
    //If the bool is set to true
    if (theSwitch)
    {
    //Sets editing the table to true
    [theTable setEditing:true];
    //Changes bool to false so next time it's clicked, else runs
    theSwitch = false;
    
    } else
    {
        //Disables editing
        [theTable setEditing:false];
        //Sets bool to true so next time it's fired, edit will come back up
        theSwitch = true;
    }
    
}


- (void)viewDidLoad
{
    //Sets initial value for bool
    theSwitch = true;
    
    //Arrays for info
    firstArray = [[NSMutableArray alloc] initWithObjects:@"Mercury", @"Venus", @"Earth", @"Mars", @"Jupiter", @"Saturn", @"Uranus", @"Neptune", @"Pluto", @"Unnamed Planet 1", @"Unnamed Planet 2", @"Unnamed Planet 3", @"Unnamed Planet 4", @"Unnamed Planet 5", @"Unnamed Planet 6", @"Unnamed Planet 7", @"Unnamed Planet 8", @"Unnamed Planet 9", @"Unnamed Planet 10", @"Unnamed Planet 11", @"Unnamed Planet 12", nil];
    
    secondArray = [[NSMutableArray alloc] initWithObjects:@"0", @"0", @"1", @"2", @"67", @"62", @"27", @"13", @"5", @"4", @"45", @"12", @"0", @"3", @"5", @"34", @"2", @"1", @"0", @"56", @"75", nil];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITable View Data Source Methods

//This sets the custom cells
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Cell identifier
    static NSString *CellIdentifierString = @"Cell";
    
    //Creates an instance of the custom cell and calls for any unused calls with the identifier
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierString];
    
    //If initial cell setup hasn't been done
    if (cell == nil)
    {
        
        
        // Creates an array to look through the different cells.  Only one type
        NSArray *differentCells = [[NSBundle mainBundle] loadNibNamed:@"CustomCellView" owner:nil options:nil];
        
        //Checks to see which cell is up
        for (UIView *view in differentCells)
        {
            //If it's the custom cell we created
            if ([view isKindOfClass:[CustomCell class]])
            {
                //Appends cell to view
                cell = (CustomCell*)view;
                
                
            }
        }
    }
    
    //Sets cell text
    cell.planetLabel2.text = [firstArray objectAtIndex:indexPath.row];
    cell.moonLabel2.text = [NSString stringWithFormat:@"Number of Moons: %@", [secondArray objectAtIndex:indexPath.row]];

    
    return cell;
    
    
}


//Returns the amount of rows, or the count of my array in this instance
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [firstArray count];
}

//Sets the editing style, which I want to be all delete
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}


//This is the commiteditingstyle option, which saves the changes to both the arrays and deletes the table cell
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Removes objects from array
    [firstArray removeObjectAtIndex:indexPath.row];
    [secondArray removeObjectAtIndex:indexPath.row];
    
    //Deletes from table
    [theTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation: true];
    
}

//Used to tell which is selected.
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    //This creates the view and presents it
    SelectedCellView *selectedCellView = [[SelectedCellView alloc] initWithNibName:@"SelectedCellView" bundle:nil];
    
    
    
    [self presentViewController:selectedCellView animated:TRUE completion:nil];
}


@end
