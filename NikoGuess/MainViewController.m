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

@synthesize resetGame;

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


-(void)viewDidAppear:(BOOL)animated{
    if(resetGame == TRUE){
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"hide"];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"overage"];
        NSLog(@"game reset complete");
        count = 0;
        gamesPlayed = 0;
        gamesWon = 0;
        [self setWinsHidden];
        resetGame = FALSE;
        
    }   
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    if(gamesWon == 0){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hide"];
    }
    
    
    BOOL hide = [[NSUserDefaults standardUserDefaults] boolForKey:@"hide"];
    if (hide) {
        [self setWinsHidden];
    }
    
}

-(void)getAnswerArray{
    answers = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"6", @"7", @"8", @"9", nil];

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


-(void)resetAnswer{
    [self getAnswerArray];
    int myIndex = arc4random_uniform(answers.count);
    answer = [answers objectAtIndex:myIndex];
}

-(void)countGreaterThanFour{
    [self countTooHigh];
    [self resetAnswer];
    NSLog(@"%@", answer);

}

-(void)answerCorrect{
    [self resetAnswer];
    NSLog(@"%@", answer);
    [self correctAnswer];
    gamesWon++;
    [self gameWin];
    [self winButtonReveal];
   
}

-(void)answerIncorrect{
    [self resetAnswer];
    NSLog(@"%@", answer);

}

-(void)everybuttonPress{
    count = count +1;
}



-(IBAction)buttonOne:(id)sender{
    [self everybuttonPress];
    guess = @"1";
    
    if(count >=4){
        [self countGreaterThanFour];
    } else if(guess == answer){
        [self answerCorrect];
        [buttonOne setHidden:NO];
    } else {
        [self answerIncorrect];
        [buttonOne setHidden:YES];
    }
    
}

-(IBAction)buttonTwo:(id)sender{
    [self everybuttonPress];
    guess = @"2";
    
    if(count >=4){
        [self countGreaterThanFour];
    } else if(guess == answer){
        [self answerCorrect];
        [buttonTwo setHidden:NO];
    } else {
        [self answerIncorrect];
        [buttonTwo setHidden:YES];
    }
    
    
}

-(IBAction)buttonThree:(id)sender{
    [self everybuttonPress];
    guess = @"3";
    
    if(count >=4){
        [self countGreaterThanFour];
    } else if(guess == answer){
        [self answerCorrect];
        [buttonThree setHidden:NO];
    } else {
        [self answerIncorrect];
        [buttonThree setHidden:YES];
    }
    
    
}
-(IBAction)buttonFour:(id)sender{
    [self everybuttonPress];
    guess = @"4";
    
    if(count >=4){
        [self countGreaterThanFour];
    } else if(guess == answer){
        [self answerCorrect];
        [buttonFour setHidden:NO];
    } else {
        [self answerIncorrect];
        [buttonFour setHidden:YES];
    }
    
    
}
-(IBAction)buttonFive:(id)sender{
    [self everybuttonPress];
    guess = @"5";
    
    if(count >=4){
        [self countGreaterThanFour];
    } else if(guess == answer){
        [self answerCorrect];
        [buttonFive setHidden:NO];
    } else {
        [self answerIncorrect];
        [buttonFive setHidden:YES];
    }
    
    
}
-(IBAction)buttonSix:(id)sender{
    [self everybuttonPress];
    guess = @"6";
    
    if(count >=4){
        [self countGreaterThanFour];
    } else if(guess == answer){
        [self answerCorrect];
        [buttonSix setHidden:NO];
    } else {
        [self answerIncorrect];
        [buttonSix setHidden:YES];
    }
    
    
}
-(IBAction)buttonSeven:(id)sender{
    [self everybuttonPress];
    guess = @"7";
    
    if(count >=4){
        [self countGreaterThanFour];
    } else if(guess == answer){
        [self answerCorrect];
        [buttonSeven setHidden:NO];
    } else {
        [self answerIncorrect];
        [buttonSeven setHidden:YES];
    }
    
}
-(IBAction)buttonEight:(id)sender{
    [self everybuttonPress];
    guess = @"8";
    
    if(count >=4){
        [self countGreaterThanFour];
    } else if(guess == answer){
        [self answerCorrect];
        [buttonEight setHidden:NO];
    } else {
        [self answerIncorrect];
        [buttonEight setHidden:YES];
    }
}
-(IBAction)buttonNine:(id)sender{
    [self everybuttonPress];
    guess = @"9";
    
    if(count >=4){
        [self countGreaterThanFour];
    } else if(guess == answer){
        [self answerCorrect];
        [buttonNine setHidden:NO];
    } else {
        [self answerIncorrect];
        [buttonNine setHidden:YES];
    }
}










@end
