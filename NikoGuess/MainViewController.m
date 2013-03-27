//
//  MainViewController.m
//  NikoGuess
//
//  Created by Ventura Rangel on 3/27/13.
//  Copyright (c) 2013 Andrews Apps. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize buttonOne;
@synthesize buttonTwo;
@synthesize buttonThree;
@synthesize buttonFour;
@synthesize buttonFive;
@synthesize buttonSix;
@synthesize buttonSeven;
@synthesize buttonEight;
@synthesize buttonNine;
NSArray *answers;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    answers = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"6", @"7", @"8", @"9", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

int count = 0;

-(IBAction)buttonOne:(id)sender{
    count = count +1;
    
    [buttonOne setHidden:YES];
}
-(IBAction)buttonTwo:(id)sender{
    [buttonTwo setHidden:YES];
    
}

-(IBAction)buttonThree:(id)sender{
    [buttonThree setHidden:YES];
    
}
-(IBAction)buttonFour:(id)sender{
    [buttonFour setHidden:YES];
    
}
-(IBAction)buttonFive:(id)sender{
    [buttonFive setHidden:YES];
    
}
-(IBAction)buttonSix:(id)sender{
    [buttonSix setHidden:YES];
    
}
-(IBAction)buttonSeven:(id)sender{
    [buttonSeven setHidden:YES];
    
}
-(IBAction)buttonEight:(id)sender{
    [buttonEight setHidden:YES];
}
-(IBAction)buttonNine:(id)sender{
    [buttonNine setHidden:YES];
}










@end
