//
//  MainViewController.h
//  NikoGuess
//
//  Created by Ventura Rangel on 3/27/13.
//  Copyright (c) 2013 Andrews Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MainViewController : UIViewController


@property BOOL resetGame;
@property (strong, nonatomic) UILabel *button;
@property (strong, nonatomic) NSString *selectionNumber;

-(void)resetButton;
-(void)dismissWinningView;

@end
