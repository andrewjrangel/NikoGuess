//
//  GuessingGame.m
//  NikoGuess
//
//  Created by Ventura Rangel on 4/2/13.
//  Copyright (c) 2013 Andrews Apps. All rights reserved.
//

#import "GuessingGame.h"
#import "MainViewController.h"

@implementation GuessingGame

NSArray *answers;
NSString *answer;

int gameGuess = 0;
int maxGuess = 4;
int gameWin = 0;
int maxWin = 3;

-(void)getAnswerArray{
    answers = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"6", @"7", @"8", @"9", nil];
}

-(void)resetAnswer{
    [self getAnswerArray];
    int myIndex = arc4random_uniform(answers.count);
    answer = [answers objectAtIndex:myIndex];
}

-(void)checkAnswer{
    
}


-(void)runGame: selectionNumber{
    gameGuess ++;
    [self resetAnswer];
    if(selectionNumber == answer){
        self.isWinner = TRUE;
    } else {
        self.isWinner = FALSE;
    }
    
}


-(void)tooManyGuesses{
    UIAlertView *overageAlert = [[UIAlertView alloc] initWithTitle:@"No More" message:@"You only have four guesses to get this cats number right!" delegate:nil cancelButtonTitle:@"Try again" otherButtonTitles:nil, nil];
    [overageAlert show];
}

-(void)correctAnswer{
    UIAlertView *guessCorrect = [[UIAlertView alloc] initWithTitle:@"Correct" message:@"You are correct!" delegate:nil cancelButtonTitle:@"Meow Meow!" otherButtonTitles:nil, nil];
    [guessCorrect show];
}

-(void)setKey{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"overage"];
    
}

//if(resetGame == TRUE){
//    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"hide"];
//    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"overage"];
//    NSLog(@"game reset complete");
//    count = 0;
//    gamesPlayed = 0;
//    gamesWon = 0;
//    [self setWinsHidden];
//    resetGame = FALSE;
//    
//}


//-(IBAction)buttonOne:(id)sender{
//    [self everybuttonPress];
//    guess = @"1";
//    
//    if(count >=4){
//        [self countGreaterThanFour];
//    } else if(guess == answer){
//        [self answerCorrect];
//    } else {
//        [self answerIncorrect];
//        [buttonOne setHidden:YES];
//    }


//-(void)gameWin{
//    gamesWon++;
//    [[NSUserDefaults standardUserDefaults] setInteger:gamesWon forKey:@"gamesWon"];
//    if (gamesWon == 3){
//        WinViewController *winView = [[WinViewController alloc] init];
//        winView.myParent = self;
//        [self presentViewController:winView animated:YES completion:nil];
//    }
//}




@end
