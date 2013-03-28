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
NSString *answer;
NSString *guess;


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
    int myIndex = arc4random_uniform(answers.count);
    answer = [answers objectAtIndex:myIndex];
    if (gamesPlayed  == 4){
        [self setKey];
    }
    BOOL over = [[NSUserDefaults standardUserDefaults] boolForKey:@"overage"];
    if (over) {
        [self setAllHidden];
        [self tooManyGuesses];
        
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

-(void)setKey{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"overage"];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

int count = 0;
int gamesPlayed = 0;

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
        gamesPlayed = gamesPlayed +1;
        [self tooManyGuesses];
        [self showAll];
    } else if(guess == answer){
        [self correctAnswer];
    } else {
        [buttonOne setHidden:YES];
    }
    
}


-(IBAction)buttonTwo:(id)sender{
    count = count +1;
    guess = @"2";
    
    if(count >=4){
        gamesPlayed = gamesPlayed +1;
        [self tooManyGuesses];
        [self showAll];
        
    } else if(guess == answer){
        [self correctAnswer];
        
    } else {
       [buttonTwo setHidden:YES]; 
    }
    
    
}

-(IBAction)buttonThree:(id)sender{
    count = count +1;
    guess = @"3";
    
    if(count >=4){
        gamesPlayed = gamesPlayed +1;
        [self tooManyGuesses];
        [self showAll];
    } else if(guess == answer){
        [self correctAnswer];
        
    } else {
       [buttonThree setHidden:YES]; 
    }
    
    
}
-(IBAction)buttonFour:(id)sender{
    count = count +1;
    guess = @"4";
    
    if(count >=4){
        gamesPlayed = gamesPlayed +1;
        [self tooManyGuesses];
        [self showAll];
    } else if(guess == answer){
        [self correctAnswer];
        
    } else {
       [buttonFour setHidden:YES]; 
    }
    
    
}
-(IBAction)buttonFive:(id)sender{
    count = count +1;
    guess = @"5";
    
    if(count >=4){
        gamesPlayed = gamesPlayed +1;
        [self tooManyGuesses];
        [self showAll];
    } else if(guess == answer){
        [self correctAnswer];
        
    } else {
        [buttonFive setHidden:YES];
    }
    
    
}
-(IBAction)buttonSix:(id)sender{
    count = count +1;
    guess = @"6";
    
    if(count >=4){
        gamesPlayed = gamesPlayed +1;
        [self tooManyGuesses];
        [self showAll];
    } else if(guess == answer){
        [self correctAnswer];
        
    } else {
       [buttonSix setHidden:YES]; 
    }
    
    
}
-(IBAction)buttonSeven:(id)sender{
    count = count +1;
    guess = @"7";
    
    if(count >=4){
        gamesPlayed = gamesPlayed +1;
        [self tooManyGuesses];
        [self showAll];
    } else if(guess == answer){
        [self correctAnswer];
        
    } else {
        [buttonSeven setHidden:YES];
    }
    
}
-(IBAction)buttonEight:(id)sender{
    count = count +1;
    guess = @"8";
    
    if(count >=4){
        gamesPlayed = gamesPlayed +1;
        [self tooManyGuesses];
        [self showAll];
    } else if(guess == answer){
        [self correctAnswer];
        
    } else{
    [buttonEight setHidden:YES];
    }
}
-(IBAction)buttonNine:(id)sender{
    count = count +1;
    guess = @"9";
    
    if(count >=4){
        gamesPlayed = gamesPlayed +1;
        [self tooManyGuesses];
        [self showAll];
    } else if(guess == answer){
        [self correctAnswer];
        
    } else{
        [buttonNine setHidden:YES];
    }
}










@end
