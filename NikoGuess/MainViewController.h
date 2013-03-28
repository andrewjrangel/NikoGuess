//
//  MainViewController.h
//  NikoGuess
//
//  Created by Ventura Rangel on 3/27/13.
//  Copyright (c) 2013 Andrews Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
-(IBAction)buttonOne:(id)sender;
-(IBAction)buttonTwo:(id)sender;
-(IBAction)buttonThree:(id)sender;
-(IBAction)buttonFour:(id)sender;
-(IBAction)buttonFive:(id)sender;
-(IBAction)buttonSix:(id)sender;
-(IBAction)buttonSeven:(id)sender;
-(IBAction)buttonEight:(id)sender;
-(IBAction)buttonNine:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *buttonOne;
@property (strong, nonatomic) IBOutlet UIButton *buttonTwo;
@property (strong, nonatomic) IBOutlet UIButton *buttonThree;
@property (strong, nonatomic) IBOutlet UIButton *buttonFour;
@property (strong, nonatomic) IBOutlet UIButton *buttonFive;
@property (strong, nonatomic) IBOutlet UIButton *buttonSix;
@property (strong, nonatomic) IBOutlet UIButton *buttonSeven;
@property (strong, nonatomic) IBOutlet UIButton *buttonEight;
@property (strong, nonatomic) IBOutlet UIButton *buttonNine;

@property (strong, nonatomic) IBOutlet UIImageView *winOne;
@property (strong, nonatomic) IBOutlet UIImageView *winTwo;
@property (strong, nonatomic) IBOutlet UIImageView *winThree;


@end
