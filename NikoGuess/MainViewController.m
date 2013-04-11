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
NSInteger gameLossCount;


-(void)viewDidAppear:(BOOL)animated{
    if(resetGame == TRUE){
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"hide"];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"overage"];
        NSLog(@"game reset complete");
       // count = 0;
       // gamesPlayed = 0;
        self.game.gamesWon = 0;
        [self hideWinButtons];
        resetGame = FALSE;
        
    }
}



- (void)viewDidLoad
{
    self.game = [[GuessingGame alloc]init];
    [self.game runGame];
    [self.game resetAnswer];
    gameLossCount = 0;
    [self hideWinButtons];
    



    
  
    
    [super viewDidLoad];
    
    for (int y = 0; y<3; y++) {
        for (int x = 0; x<3; x++) {
            UIButton *button = [[UIButton alloc]init];
            button.frame = CGRectMake(x*100+15, y*70+150, 75, 64);
            button.tag = 987;
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
        
//        for (int yy = 0; yy<1; yy++) {
//            for (int xx = 0; xx<3; xx++) {
//                UIButton *winButton = [[UIButton alloc] init];
//                winButton.tag = xx;
//                winButton.frame = CGRectMake(xx*75+15, yy*10+375, 75.2, 61);
//                [winButton setBackgroundImage:[UIImage imageNamed:@"nekobean_smile.png"] forState:UIControlStateNormal];
//                [self.view addSubview:winButton];
//                UILabel *winButtonHide = [[UILabel alloc] initWithFrame:CGRectMake(25, 25, 25, 25)];
//                winButtonHide.text = [NSString stringWithFormat:@"%d", yy*3+xx+1];
//                winButtonHide.backgroundColor = [UIColor clearColor];
//                winButtonHide.textColor = [UIColor clearColor];
//                [winButton addSubview:winButtonHide];
//            
//            }
//        }
    }
}

//UIView *win1Button = [self.view viewWithTag:0];
-(void)hideWinButtons{
    [self.win1 setHidden:YES];
    [self.win2 setHidden:YES];
    [self.win3 setHidden:YES];
}

-(void)displayWinButtons{
    if (self.game.win3 == TRUE){
        [self.win1 setHidden:NO];
        [self.win2 setHidden:NO];
        [self.win3 setHidden:NO];
    } else if (self.game.win2 == TRUE){
        [self.win1 setHidden:NO];
        [self.win2 setHidden:NO];
    } else if (self.game.win1 == TRUE){
        [self.win1 setHidden:NO];
    }
}


- (void)resetToNewGame {
    self.game.gameGuess = 0;
    self.game.gamesWon = 0;
    NSArray *views = [self.view subviews];
    for (UIView *view in views) {
        
        if ([view isKindOfClass:[UIButton class]]) {

            if (view.tag == 987) {
                [view setHidden:NO];
               
            }
        }
    }
}

- (void)clearAllButtons {
    NSArray *views = [self.view subviews];
    for (UIView *view in views) {
        
        if ([view isKindOfClass:[UIButton class]]) {
            [view setHidden:YES];
            
        }
    }
}

-(void)handleButton:(UIButton *)button{
    self.game.gameGuess++;
    selectionNumber = [[button.subviews lastObject] text];
    NSLog(@"selection button on top %@", selectionNumber);
    [self.game checkAnswer:selectionNumber forAnswer:self.game.answer];
    [button setHidden:YES];
  
    if (gameLossCount >=4) {
        [self clearAllButtons];
        
        UIAlertView *gameLossAlert = [[UIAlertView alloc] initWithTitle:@"Game Over" message:@"You can no longer play this game until you buy the premium version" delegate:nil cancelButtonTitle:@"Purchase" otherButtonTitles:@"Cancel", nil];
        
        [gameLossAlert show];
        
        NSLog(@"too many guesses");
        
    } else if (self.game.gameGuess >=4) {
        gameLossCount++;
        [self resetToNewGame];
        
        UIAlertView *overageAlert = [[UIAlertView alloc] initWithTitle:@"No More" message:@"You only have four guesses to get this cats number right!" delegate:nil cancelButtonTitle:@"Try again" otherButtonTitles:nil, nil];
        [overageAlert show];
        NSLog(@"too many guesses");
        
        [self.game resetAnswer];

    } else if (self.game.isWinner == TRUE){
        [self.game winGame];

        if (self.game.showWinView == TRUE){
            WinViewController *winView = [[WinViewController alloc] init];
            winView.myParent = self;
            [self presentViewController:winView animated:YES completion:nil];
        }
        [self displayWinButtons];
        [self.game resetAnswer];
        [self resetToNewGame];


        NSLog(@"you win! in button press");
    } else {
        NSLog(@"you lost in button press");
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
