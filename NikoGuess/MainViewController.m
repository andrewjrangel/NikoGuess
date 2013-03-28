//
//  MainViewController.m
//  NikoGuess
//
//  Created by Ventura Rangel on 3/27/13.
//  Copyright (c) 2013 Andrews Apps. All rights reserved.
//

#import "MainViewController.h"
#import "WinViewController.h"

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

@synthesize winOne;
@synthesize winTwo;
@synthesize winThree;

NSArray *answers;
NSString *answer;
NSString *guess;
int count = 0;
int gamesPlayed = 0;
int gamesWon = 0;

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
    if(gamesWon == 0){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hide"];
    }
    answers = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"6", @"7", @"8", @"9", nil];
    int myIndex = arc4random_uniform(answers.count);
    answer = [answers objectAtIndex:myIndex];
    
    
    
    
    
    BOOL hide = [[NSUserDefaults standardUserDefaults] boolForKey:@"hide"];
    if (hide) {
        [self setWinsHidden];
    }
    
}




-(void)setAllHidden{
    [buttonOne setHidden:YES];
    [buttonTwo setHidden:YES];
    [buttonThree setHidden:YES];
    [buttonFour setHidden:YES];
    [buttonFive setHidden:YES];
    [buttonSix setHidden:YES];
    [buttonSeven setHidden:YES];
    [buttonEight setHidden:YES];
    [buttonNine setHidden:YES];
    [self setWinsHidden];
}
-(void)showAll{
    [buttonOne setHidden:NO];
    [buttonTwo setHidden:NO];
    [buttonThree setHidden:NO];
    [buttonFour setHidden:NO];
    [buttonFive setHidden:NO];
    [buttonSix setHidden:NO];
    [buttonSeven setHidden:NO];
    [buttonEight setHidden:NO];
    [buttonNine setHidden:NO];
}
-(void)setWinsHidden{
    [winOne setHidden:YES];
    [winTwo setHidden:YES];
    [winThree setHidden:YES];
}
-(void)winButtonReveal{
    
    if (gamesWon == 1){
        [winOne setHidden:NO];
    }
    if (gamesWon == 2){
        [winTwo setHidden:NO];
    }
    if (gamesWon == 3){
        [winThree setHidden:NO];
    
    }
}

-(void)setKey{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"overage"];

}

-(void)gameWin{
    if (gamesWon == 3){
        WinViewController *winView = [[WinViewController alloc] init];
        winView.myParent = self;
        [self presentViewController:winView animated:YES completion:nil];
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


-(void)countTooHigh{
    gamesPlayed = gamesPlayed +1;
    
    [self showAll];
    count = 0;
    if(gamesPlayed>= 4){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"overage"];
    BOOL over = [[NSUserDefaults standardUserDefaults] boolForKey:@"overage"];
        if (over) {
            [self setAllHidden];
        }
    }
    [self tooManyGuesses];

}

-(void)tooManyGuesses{
    UIAlertView *overageAlert = [[UIAlertView alloc] initWithTitle:@"No More" message:@"You only have four guesses to get this cats number right!" delegate:nil cancelButtonTitle:@"Try again" otherButtonTitles:nil, nil];
    [overageAlert show];
}

-(void)correctAnswer{
    UIAlertView *guessCorrect = [[UIAlertView alloc] initWithTitle:@"Correct" message:@"You are correct!" delegate:nil cancelButtonTitle:@"Meow Meow!" otherButtonTitles:nil, nil];
    [guessCorrect show];
}


-(IBAction)buttonOne:(id)sender{
    count = count +1;
    guess = @"1";
    
    if(count >=4){
        [self countTooHigh];
    } else if(guess == answer){
        [self correctAnswer];
        gamesWon++;
        [self gameWin];
        [self winButtonReveal];
        [buttonOne setHidden:NO];
    } else {
        [buttonOne setHidden:YES];
    }
    
}


-(IBAction)buttonTwo:(id)sender{
    count = count +1;
    guess = @"2";
    
    if(count >=4){
        [self countTooHigh];
    } else if(guess == answer){
        [self correctAnswer];
        gamesWon++;
        [self gameWin];
        [self winButtonReveal];
        [buttonTwo setHidden:NO];
    } else {
       [buttonTwo setHidden:YES]; 
    }
    
    
}

-(IBAction)buttonThree:(id)sender{
    count = count +1;
    guess = @"3";
    
    if(count >=4){
        [self countTooHigh];
    } else if(guess == answer){
        [self correctAnswer];
        gamesWon++;
        [self gameWin];
        [self winButtonReveal];
        [buttonThree setHidden:NO];
    } else {
       [buttonThree setHidden:YES]; 
    }
    
    
}
-(IBAction)buttonFour:(id)sender{
    count = count +1;
    guess = @"4";
    
    if(count >=4){
        [self countTooHigh];
    } else if(guess == answer){
        [self correctAnswer];
        gamesWon++;
        [self gameWin];
        [self winButtonReveal];
        [buttonFour setHidden:NO];
    } else {
       [buttonFour setHidden:YES]; 
    }
    
    
}
-(IBAction)buttonFive:(id)sender{
    count = count +1;
    guess = @"5";
    
    if(count >=4){
        [self countTooHigh];
    } else if(guess == answer){
        [self correctAnswer];
        gamesWon++;
        [self gameWin];
        [self winButtonReveal];
        [buttonFive setHidden:NO];
    } else {
        [buttonFive setHidden:YES];
    }
    
    
}
-(IBAction)buttonSix:(id)sender{
    count = count +1;
    guess = @"6";
    
    if(count >=4){
        [self countTooHigh];
    } else if(guess == answer){
        [self correctAnswer];
        gamesWon++;
        [self gameWin];
        [self winButtonReveal];
        [buttonSix setHidden:NO];
    } else {
       [buttonSix setHidden:YES]; 
    }
    
    
}
-(IBAction)buttonSeven:(id)sender{
    count = count +1;
    guess = @"7";
    
    if(count >=4){
        [self countTooHigh];
    } else if(guess == answer){
        [self correctAnswer];
        gamesWon++;
        [self gameWin];
        [self winButtonReveal];
        [buttonSeven setHidden:NO];
    } else {
        [buttonSeven setHidden:YES];
    }
    
}
-(IBAction)buttonEight:(id)sender{
    count = count +1;
    guess = @"8";
    
    if(count >=4){
        [self countTooHigh];
    } else if(guess == answer){
        [self correctAnswer];
        gamesWon++;
        [self gameWin];
        [self winButtonReveal];
        [buttonEight setHidden:NO];
    } else{
    [buttonEight setHidden:YES];
    }
}
-(IBAction)buttonNine:(id)sender{
    count = count +1;
    guess = @"9";
    
    if(count >=4){
        [self countTooHigh];
    } else if(guess == answer){
        [self correctAnswer];
        gamesWon++;
        [self gameWin];
        [self winButtonReveal];
        [buttonNine setHidden:NO];
    } else{
        [buttonNine setHidden:YES];
    }
}










@end
