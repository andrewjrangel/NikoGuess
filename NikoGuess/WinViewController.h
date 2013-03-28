//
//  WinViewController.h
//  NikoGuess
//
//  Created by Ventura Rangel on 3/28/13.
//  Copyright (c) 2013 Andrews Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface WinViewController : UIViewController
@property (strong, nonatomic) MainViewController *myParent;

- (IBAction)backButton:(id)sender;


@end
