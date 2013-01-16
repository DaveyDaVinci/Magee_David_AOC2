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
            
            //Changes text colors to white
            mainLabel.textColor = [UIColor whiteColor];
            bgLabel.textColor = [UIColor whiteColor];
            multiplierLabel.textColor = [UIColor whiteColor];
        } else if (colorIndex == 1){
            self.view.backgroundColor = [UIColor redColor]; //If 1, changes to red
            
            //Changes text colors to white
            mainLabel.textColor = [UIColor whiteColor];
            bgLabel.textColor = [UIColor whiteColor];
            multiplierLabel.textColor = [UIColor whiteColor];
        } else if (colorIndex == 2){
            self.view.backgroundColor = [UIColor greenColor]; //If 2, changes to green
            
            //Changes text colors to black
            mainLabel.textColor = [UIColor blackColor];
            bgLabel.textColor = [UIColor blackColor];
            multiplierLabel.textColor = [UIColor blackColor];
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
    int multiplied = multiplier.value;
    mainLabel.text = [NSString stringWithFormat:@"Multiplier is set at %d, the Destroyer's speed is ready to be calculated", multiplied];//Changes text to say destroyer
    
    //These enable and disable the buttons, as well as change the alphas to appear grayed out
    destroyerButton.enabled = false;
    cargoButton.enabled = true;
    bountyButton.enabled = true;
    destroyerButton.alpha = 0.8;
    cargoButton.alpha = 1;
    bountyButton.alpha = 1;
    tracker = [NSString stringWithFormat:@"Destroyer"];
    
    
}

-(IBAction)cargoFunction:(id)sender
{
    int multiplied = multiplier.value;
    mainLabel.text = [NSString stringWithFormat:@"Multiplier is set at %d, the Cargo Ship's speed is ready to be calculated", multiplied];//Changes text to say Cargo
    
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
    int multiplied = multiplier.value;
    mainLabel.text = [NSString stringWithFormat:@"Multiplier is set at %d, the Bounty Ship's speed is ready to be calculated", multiplied];//Changes text to say Bounty
    
    //These enable and disable, as well as change the alphas to appear grayed out
    destroyerButton.enabled = true;
    cargoButton.enabled = true;
    bountyButton.enabled = false;
    destroyerButton.alpha = 1;
    cargoButton.alpha = 1;
    bountyButton.alpha = 0.8;

    
}



//Stepper function
-(IBAction)multiplierFunction:(id)sender
{
    int multiplied = multiplier.value;
    if (destroyerButton.enabled && cargoButton.enabled && bountyButton.enabled == true)
    {
    mainLabel.text = [NSString stringWithFormat:@"Multiplier is set at %d", multiplied];
    } else if (destroyerButton.enabled == false)
    {
        mainLabel.text = [NSString stringWithFormat:@"Multiplier is set at %d, the Destroyer's speed is ready to be calculated", multiplied];
    } else if (cargoButton.enabled == false)
    {
        mainLabel.text = [NSString stringWithFormat:@"Multiplier is set at %d, the Cargo Ship's speed is ready to be calculated", multiplied];
    } else if (bountyButton.enabled == false)
    {
        mainLabel.text = [NSString stringWithFormat:@"Multiplier is set at %d, the Bounty Ship's speed is ready to be calculated", multiplied];
    }


}






//Calculate button function
-(IBAction)calculateSpeedWithMultiplier:(id)sender
{
    int multiplied = multiplier.value; //This grabs the value of the stepper and stoers it in an int
    mainLabel.text = [NSString stringWithFormat:@"Multiplier is set at %d, no ship selected", multiplied]; //replaces the main label with a string that shows the value of the stepper if no ship is selected
    if (cargoButton.enabled == false) //Grabs the bool of the cargo button
    {
        cargoShip *cargoholder2 = (cargoShip*)[shipFactory createNewShip:CARGO]; //Grabs ship from factory
        if (cargoholder2 != nil)
        {
            [cargoholder2 setPoundsOfCargo:300]; //Sets pounds of cargo
            [cargoholder2 calculateShipSpeed]; //Runs the class's calculation
            int totalSpeed = cargoholder2.howFastShipTravels * multiplied; //multiplies calculation by stepper
            mainLabel.text = [NSString stringWithFormat:@"The cargo ship is going %d mph", totalSpeed]; //Replaces string with calculation results
            multiplier.value = 1; //resets stepper
            
        }
    } else if (destroyerButton.enabled == false)//Grabs bool of destroyer button
    {
        destroyerShip *destroyerholder2 = (destroyerShip*)[shipFactory createNewShip:DESTROYER]; //grabs ship from factory
        if (destroyerholder2 != nil)
        {
            [destroyerholder2 setDestroyedShips:3]; //sets ships
            [destroyerholder2 calculateShipSpeed]; //runs the class's calculation
            int totalSpeed = destroyerholder2.howFastShipTravels * multiplied; //multiplies calculation by stepper
            mainLabel.text = [NSString stringWithFormat:@"The destroyer is going %d mph", totalSpeed]; //Replaces string with calculation results
            multiplier.value = 1; //resets stepper
        }
        
    } else if (bountyButton.enabled == false)
    {
        bountyShip *bountyholder2 = (bountyShip*)[shipFactory createNewShip:BOUNTY]; //creates ship from factory
        if (bountyholder2 != nil)
        {
            [bountyholder2 setNumberOfPrisoners:13];//Sets number of prisoners
            [bountyholder2 calculateShipSpeed]; //Runs class's calculations
            int totalSpeed = bountyholder2.howFastShipTravels * multiplied; //multiplies calculation by stepper
            mainLabel.text = [NSString stringWithFormat:@"The bounty ship is going %d mph", totalSpeed]; //replaces string with calculation results
            multiplier.value = 1; //resets multiplier value

        }
    
    }
    multiplier.value = 1; //resets multiplier value
}



- (void)viewDidLoad
{
    
    self.view.backgroundColor = [UIColor blueColor]; //Sets default background color
    
    //sets default text colors
    mainLabel.textColor = [UIColor whiteColor];
    bgLabel.textColor = [UIColor whiteColor];
    multiplierLabel.textColor = [UIColor whiteColor];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
