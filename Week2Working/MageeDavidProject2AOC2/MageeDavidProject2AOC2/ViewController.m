//
//  ViewController.m
//  MageeDavidProject2AOC2
//
//  Created by David Magee on 1/16/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import "ViewController.h"
#import "InfoView.h"

@interface ViewController ()

@end

@implementation ViewController




//Color changes
-(IBAction)colorChanger:(id)sender //Calls the color changer function
{
    UISegmentedControl *changeColor = (UISegmentedControl*) sender; //Sets up the controller with a pointer to sender
    if (changeColor != nil)
    {
        int colorIndex = changeColor.selectedSegmentIndex; //Grabs the index value 
        
        if (colorIndex == 0)
        {
            self.view.backgroundColor = [UIColor blueColor]; //If 0, changes to blue
        } else if (colorIndex == 1){
            self.view.backgroundColor = [UIColor redColor]; //If 1, changes to red
        } else if (colorIndex == 2){
            self.view.backgroundColor = [UIColor greenColor]; //If 2, changes to green
        }
    }
}


//Info button
-(IBAction)infoButton:(id)sender //Info button function
{
    InfoView *secondView = [[InfoView alloc] initWithNibName:@"InfoView" bundle:nil];
    if (secondView != nil) //Allocates second view, inits from the xib file
    {
        [self presentViewController:secondView animated:true completion:nil]; //Brings up the second view
    }
}



//Ship Buttons
-(IBAction)destroyerFunction:(id)sender
{
    mainLabel.text = [NSString stringWithFormat:@"Destroyer selected"];//Changes text to say destroyer
    
    //These enable and disable, as well as change the alphas to appear grayed out
    destroyerButton.enabled = false;
    cargoButton.enabled = true;
    bountyButton.enabled = true;
    destroyerButton.alpha = 0.8;
    cargoButton.alpha = 1;
    bountyButton.alpha = 1;
    
}

-(IBAction)cargoFunction:(id)sender
{
    mainLabel.text = [NSString stringWithFormat:@"Cargo Ship selected"];//Changes text to say Cargo
    
    //These enable and disable, as well as change the alphas to appear grayed out
    destroyerButton.enabled = true;
    cargoButton.enabled = false;
    bountyButton.enabled = true;
    destroyerButton.alpha = 1;
    cargoButton.alpha = 0.8;
    bountyButton.alpha = 1;
    
}


-(IBAction)bountyFunction:(id)sender
{
    mainLabel.text = [NSString stringWithFormat:@"Bounty Ship selected"];//Changes text to say Bounty
    
    //These enable and disable, as well as change the alphas to appear grayed out
    destroyerButton.enabled = true;
    cargoButton.enabled = true;
    bountyButton.enabled = false;
    destroyerButton.alpha = 1;
    cargoButton.alpha = 1;
    bountyButton.alpha = 0.8;
    
}


-(IBAction)calculateSpeedWithMultiplier:(id)sender
{
    int multiplied = multiplier.value;
    mainLabel.text = [NSString stringWithFormat:@"%d", multiplied];
}











- (void)viewDidLoad
{
    
    self.view.backgroundColor = [UIColor blueColor]; //Sets default background color
    
    
    
    //Creates and allocates a title label so it looks pretty c:
        
        
    //Cargo Ship Section
    
    
    //Creates the cargo ship and overrides the pounds of cargo
    cargoShip *cargoholder = (cargoShip*)[shipFactory createNewShip:CARGO]; //Calls upon the cargoShip class, gives it a name, then accesses the factory and creates a new ship based onthe enum value
    
    if (cargoholder != nil)
    {
        
        [cargoholder setPoundsOfCargo:300]; //Sets weight
        [cargoholder calculateShipSpeed]; //Recalculates the ship speed with new info from above
        int maxEngines = cargoholder.numOfEngines * cargoholder.howFastShipTravels; //Calculates speed with number of engines
        
    }
    
    
    
    //Destroyer Ship Section
    
    destroyerShip *destroyerholder = (destroyerShip*)[shipFactory createNewShip:DESTROYER]; //Calls upon the destroyerShip class, gives it a name, then accesses the factory and creates a new ship based onthe enum value
    if (destroyerholder != nil)
    {
        
        [destroyerholder setDestroyedShips:7];
        [destroyerholder calculateShipSpeed];
        int maxEngines = destroyerholder.numOfEngines * destroyerholder.howFastShipTravels; //Modifies the speed by multiplying it by number of engines
       
    }
    
    
    
    //Bounty ship section
    
    
    bountyShip *bountyholder = (bountyShip*)[shipFactory createNewShip:BOUNTY]; //Access to bountyShip class, renames it as a holder, passes in the argument through the ship factory based on the enum in the base class header.
    if (bountyholder != nil)
    {
        
        [bountyholder setNumberOfPrisoners:13];//Sets number of prisoners
        [bountyholder calculateShipSpeed];
        int maxEngines = bountyholder.numOfEngines * bountyholder.howFastShipTravels;
    }
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
