//
//  MainViewController.m
//  NikoGuess
//
//  Created by Ventura Rangel on 3/27/13.
//  Copyright (c) 2013 Andrews Apps. All rights reserved.
//

#import "MainViewController.h"
#import "WinViewController.h"
#import "GuessingGame.h"

@interface MainViewController ()
@property (nonatomic, strong) GuessingGame *game;
@end

@implementation MainViewController

@synthesize resetGame;


NSString *selectionNumber;






- (void)viewDidLoad
{
    self.game = [[GuessingGame alloc]init];
    [self.game runGame];

    
  
    
    [super viewDidLoad];
    
    for (int y = 0; y<3; y++) {
        for (int x = 0; x<3; x++) {
            UIButton *button = [[UIButton alloc]init];
            button.frame = CGRectMake(x*100+15, y*70+150, 75, 64);
            [button setBackgroundImage:[UIImage imageNamed:@"cat-head-outline-th"] forState:UIControlStateNormal];
            [self.view addSubview:button];
            [button addTarget:self action:@selector(handleButton:) forControlEvents:UIControlEventTouchUpInside];
            UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(30, 25, 25, 25)];
            title.text = [NSString stringWithFormat:@"%d", y*3+x+1];
            if ([title.text isEqual: @"5"]) {
                button.frame = CGRectMake(x*100+10, y*70+145, 95, 80);
                [button setBackgroundImage:[UIImage imageNamed:@"nekobean_smile"] forState:UIControlStateNormal];
            }
            title.backgroundColor = [UIColor clearColor];
            title.textColor = [UIColor cyanColor];
            title.font = [UIFont systemFontOfSize:24];
            title.shadowColor = [UIColor blueColor];
            title.shadowOffset = CGSizeMake(1.0, 1.0);
            if ([title.text isEqualToString:@"5"]){
                title.textColor = [UIColor whiteColor];
                title.font = [UIFont systemFontOfSize:32];

            }
            [button addSubview:title];
        }
        
        for (int yy = 0; yy<1; yy++) {
            for (int xx = 0; xx<3; xx++) {
                UIButton *winButton = [[UIButton alloc] init];
                winButton.frame = CGRectMake(xx*75+15, yy*10+375, 75.2, 61);
                [winButton setBackgroundImage:[UIImage imageNamed:@"nekobean_smile.png"] forState:UIControlStateNormal];
                [self.view addSubview:winButton];
                UILabel *winButtonHide = [[UILabel alloc] initWithFrame:CGRectMake(25, 25, 25, 25)];
                winButtonHide.text = [NSString stringWithFormat:@"%d", yy*3+xx+1];
                winButtonHide.backgroundColor = [UIColor clearColor];
                winButtonHide.textColor = [UIColor clearColor];
                [winButton addSubview:winButtonHide];
            
            }
        }
    }
    
    
   
    
    

}



-(void)handleButton:(UIButton *)button{
    selectionNumber = [[button.subviews lastObject] text];
    NSLog(@"selection button on top %@", selectionNumber);
    
    //[button setHidden:YES];
    [self checkAnswer];
    [button setHidden:YES];
    
    self.game.gameGuess++;
    
    if (self.game.gameGuess >=4) {
        [self.game tooManyGuesses];
        NSLog(@"too many guesses");
        
    } else if (self.game.isWinner == TRUE){
        [self.game winGame];
        NSLog(@"you win! in button press");
        [button setHidden:NO];
    } else {
        NSLog(@"you lost in button press");
    }
}


-(void)checkAnswer{
    if (selectionNumber ==  self.game.answer) {
        NSLog(@"winner in CA selectionNumber = %@", selectionNumber);
        NSLog(@"answer = %@", self.game.answer);
        self.game.isWinner = TRUE;
    } else {
        NSLog(@"loser in CA selectionNumber = %@", selectionNumber);
        NSLog(@"answer = %@", self.game.answer);

        
    }
}


-(void)dismissWinningView{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
















@end
