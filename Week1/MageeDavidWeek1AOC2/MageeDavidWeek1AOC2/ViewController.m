//
//  ViewController.m
//  MageeDavidWeek1AOC2
//
//  Created by David Magee on 1/10/13.
//  Copyright (c) 2013 David Magee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    
    
    //Creates and allocates a title label so it looks pretty c:
    titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 320, 40)];
    if (titleLable != nil) {
        titleLable.backgroundColor = [UIColor colorWithRed:0.245 green:0.445 blue:0.765 alpha:1]; 
        titleLable.textColor =[UIColor whiteColor];
        titleLable.text =@"Ship Factory";
        titleLable.textAlignment = NSTextAlignmentCenter;
        
        
    }
    [self.view addSubview:titleLable];
    
    
    //Cargo Ship Section
    
    
    //Creates the cargo ship and overrides the pounds of cargo
    cargoShip *cargoholder = (cargoShip*)[shipFactory createNewShip:CARGO];
    
    if (cargoholder != nil)
    {
    
        [cargoholder setWeight:1200];
        [cargoholder calculateShipSpeed];
        cargoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 50.0f, 320.0f, 40.0f)];
        if (cargoLabel != nil) {
            cargoLabel.backgroundColor= [UIColor colorWithRed:0 green:0.344 blue:0.235 alpha:1];
            cargoLabel.text = [NSString stringWithFormat:@"The %@ flies at %i mph", cargoholder.nameOfShip, cargoholder.howFastShipTravels];
            cargoLabel.textAlignment = NSTextAlignmentCenter;
            cargoLabel.textColor =[UIColor whiteColor];
            cargoLabel.numberOfLines= 3;
           
        }
        
      
        [self.view addSubview:cargoLabel];
        
        int maxEngines = cargoholder.numOfEngines * cargoholder.howFastShipTravels;
        
                
    
    }
    
    
    
    //Destroyer Ship Section
    
    destroyerShip *destroyerholder = (destroyerShip*)[shipFactory createNewShip:DESTROYER];
    if (destroyerholder != nil)
    {
    
        [destroyerholder setDestroyedShips:7];
        [destroyerholder calculateShipSpeed];
        destroyerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 100.0f, 320, 40)];
        if (destroyerLabel != nil) {
            destroyerLabel.backgroundColor =[UIColor colorWithRed:0 green:0.344 blue:0.235 alpha:1]; 
            destroyerLabel.text = [NSString stringWithFormat:@"The %@ flies at %i mph", destroyerholder.nameOfShip, destroyerholder.howFastShipTravels];
            destroyerLabel.textColor =[UIColor whiteColor];
            destroyerLabel.numberOfLines = 2;
        }
        // call into view
        [self.view addSubview:destroyerLabel];
    
    }
    
    
    
    //Bounty ship section
    
    
    bountyShip *bountyholder = (bountyShip*)[shipFactory createNewShip:BOUNTY];
    if (bountyholder != nil)
    {
        
        [bountyholder setNumberOfPrisoners:13];
        [bountyholder calculateShipSpeed];
        bountyLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.0f, 150.0f, 320, 40)];
        if (bountyLabel != nil) {
            bountyLabel.backgroundColor =[UIColor colorWithRed:0 green:0.344 blue:0.235 alpha:1]; 
            bountyLabel.text = [NSString stringWithFormat:@"The %@ flies at %i mph", bountyholder.nameOfShip, bountyholder.howFastShipTravels];
            bountyLabel.textColor =[UIColor whiteColor];
            bountyLabel.numberOfLines = 3;
        }
        [self.view addSubview:bountyLabel];
        
        
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
