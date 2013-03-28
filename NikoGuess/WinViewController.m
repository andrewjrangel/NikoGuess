//
//  WinViewController.m
//  NikoGuess
//
//  Created by Ventura Rangel on 3/28/13.
//  Copyright (c) 2013 Andrews Apps. All rights reserved.
//

#import "WinViewController.h"
#import "MainViewController.h"

@interface WinViewController ()

@end

@implementation WinViewController


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
    // Do any additional setup after loading the view from its nib.
    mainViewController = [[MainViewController alloc] init];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(id)sender {
    mainViewController.resetGame = TRUE;
    [self.myParent dismissWinningView];
    
}
@end
