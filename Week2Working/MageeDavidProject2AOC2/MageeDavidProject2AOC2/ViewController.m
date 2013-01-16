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
-(IBAction)colorChanger:(id)sender
{
    UISegmentedControl *changeColor = (UISegmentedControl*) sender;
    if (changeColor != nil)
    {
        int colorIndex = changeColor.selectedSegmentIndex;
        
        if (colorIndex == 0)
        {
            self.view.backgroundColor = [UIColor blueColor];
        } else if (colorIndex == 1){
            self.view.backgroundColor = [UIColor redColor];
        } else if (colorIndex == 2){
            self.view.backgroundColor = [UIColor greenColor];
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






- (void)viewDidLoad
{
    
    self.view.backgroundColor = [UIColor blueColor];
    
    
    
    //Creates and allocates a title label so it looks pretty c:
    titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 40.0f)]; //Allocs and inits with a frame
    if (titleLable != nil) {
        titleLable.backgroundColor = [UIColor colorWithRed:0.245 green:0.445 blue:0.765 alpha:1]; //Sets color
        titleLable.textColor =[UIColor whiteColor]; //Sets text color
        titleLable.text =@"Ship Factory"; //Sets text in label
        titleLable.textAlignment = NSTextAlignmentCenter; //Aligns text to center
        
        
    }
    [self.view addSubview:titleLable]; //Shows the view on the screen
    
    
    //Cargo Ship Section
    
    
    //Creates the cargo ship and overrides the pounds of cargo
    cargoShip *cargoholder = (cargoShip*)[shipFactory createNewShip:CARGO]; //Calls upon the cargoShip class, gives it a name, then accesses the factory and creates a new ship based onthe enum value
    
    if (cargoholder != nil)
    {
        
        [cargoholder setPoundsOfCargo:300]; //Sets weight
        [cargoholder calculateShipSpeed]; //Recalculates the ship speed with new info from above
        cargoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 50.0f, 320.0f, 50.0f)]; //Standard label stuff
        if (cargoLabel != nil) {
            cargoLabel.backgroundColor= [UIColor colorWithRed:0 green:0.344 blue:0.235 alpha:1];
            cargoLabel.text = [NSString stringWithFormat:@"The %@ flies at %i mph on a single engine, at a weight of %i tons", cargoholder.nameOfShip, cargoholder.howFastShipTravels, cargoholder.poundsOfCargo]; //Sets the string and int values in text
            cargoLabel.textAlignment = NSTextAlignmentCenter;
            cargoLabel.textColor =[UIColor whiteColor];
            cargoLabel.numberOfLines= 3;
            
        }
        
        
        [self.view addSubview:cargoLabel];
        
        int maxEngines = cargoholder.numOfEngines * cargoholder.howFastShipTravels; //Calculates speed with number of engines
        
        
        //Second label
        cargoLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 110.0f, 320.0f, 50.0f)];//Standard label stuff
        if (cargoLabel2 != nil) {
            cargoLabel2.backgroundColor= [UIColor colorWithRed:0 green:0.344 blue:0.235 alpha:1];
            cargoLabel2.text = [NSString stringWithFormat:@"The %@ flies at %i mph with all %i engines running", cargoholder.nameOfShip, maxEngines, cargoholder.numOfEngines]; //Adds in the speed with full engines
            cargoLabel2.textAlignment = NSTextAlignmentCenter;
            cargoLabel2.textColor =[UIColor whiteColor];
            cargoLabel2.numberOfLines= 3;
            
            
        }
        
        
        [self.view addSubview:cargoLabel2];//Sets view
        
        
    }
    
    
    
    //Destroyer Ship Section
    
    destroyerShip *destroyerholder = (destroyerShip*)[shipFactory createNewShip:DESTROYER]; //Calls upon the destroyerShip class, gives it a name, then accesses the factory and creates a new ship based onthe enum value
    if (destroyerholder != nil)
    {
        
        [destroyerholder setDestroyedShips:7];
        [destroyerholder calculateShipSpeed];
        destroyerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.0f, 170.0f, 320.0f, 50.0f)];//Standard label stuff
        if (destroyerLabel != nil) {
            destroyerLabel.backgroundColor =[UIColor colorWithRed:0.765 green:0.344 blue:0.235 alpha:1];
            destroyerLabel.text = [NSString stringWithFormat:@"The %@ flies at %i mph on a single engine, and has destroyed %i ships", destroyerholder.nameOfShip, destroyerholder.howFastShipTravels, destroyerholder.destroyedShips];
            destroyerLabel.textColor =[UIColor whiteColor];
            destroyerLabel.numberOfLines = 2;
            destroyerLabel.textAlignment = NSTextAlignmentCenter;
        }
        
        [self.view addSubview:destroyerLabel];
        
        int maxEngines = destroyerholder.numOfEngines * destroyerholder.howFastShipTravels; //Modifies the speed by multiplying it by number of engines
        
        
        //Second label
        destroyerLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(0.0f, 230.0f, 320.0f, 50.0f)]; //Standard label stuff
        if (destroyerLabel2 != nil) {
            destroyerLabel2.backgroundColor =[UIColor colorWithRed:0.765 green:0.344 blue:0.235 alpha:1];
            destroyerLabel2.text = [NSString stringWithFormat:@"The %@ flies at %i mph with all %i engines running", destroyerholder.nameOfShip, maxEngines, destroyerholder.numOfEngines];
            destroyerLabel2.textColor =[UIColor whiteColor];
            destroyerLabel2.numberOfLines = 2;
            destroyerLabel2.textAlignment = NSTextAlignmentCenter;
        }
        
        [self.view addSubview:destroyerLabel2];
        
        
        
    }
    
    
    
    //Bounty ship section
    
    
    bountyShip *bountyholder = (bountyShip*)[shipFactory createNewShip:BOUNTY]; //Access to bountyShip class, renames it as a holder, passes in the argument through the ship factory based on the enum in the base class header.
    if (bountyholder != nil)
    {
        
        [bountyholder setNumberOfPrisoners:13];//Sets number of prisoners
        [bountyholder calculateShipSpeed];
        bountyLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.0f, 290.0f, 320.0f, 50.0f)];
        if (bountyLabel != nil) {
            bountyLabel.backgroundColor =[UIColor colorWithRed:0.543 green:0.344 blue:0.635 alpha:1];
            bountyLabel.text = [NSString stringWithFormat:@"The %@ flies at %i mph on a single engine, and has %i prisoners on board", bountyholder.nameOfShip, bountyholder.howFastShipTravels, bountyholder.numberOfPrisoners];
            bountyLabel.textColor =[UIColor whiteColor];
            bountyLabel.numberOfLines = 3;
            bountyLabel.textAlignment = NSTextAlignmentCenter;
        }
        [self.view addSubview:bountyLabel];
        
        
        
        //Second label
        int maxEngines = bountyholder.numOfEngines * bountyholder.howFastShipTravels;
        
        bountyLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(0.0f, 350.0f, 320.0f, 50.0f)];
        if (bountyLabel2 != nil) {
            bountyLabel2.backgroundColor =[UIColor colorWithRed:0.543 green:0.344 blue:0.635 alpha:1];
            bountyLabel2.text = [NSString stringWithFormat:@"The %@ flies at %i mph with all %i engines running", bountyholder.nameOfShip, maxEngines, bountyholder.numOfEngines];
            bountyLabel2.textColor =[UIColor whiteColor];
            bountyLabel2.numberOfLines = 3;
            bountyLabel2.textAlignment = NSTextAlignmentCenter;
        }
        [self.view addSubview:bountyLabel2];
        
        
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
