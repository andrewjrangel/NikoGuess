//
//  GuessingGame.m
//  NikoGuess
//
//  Created by Ventura Rangel on 4/2/13.
//  Copyright (c) 2013 Andrews Apps. All rights reserved.
//

#import "GuessingGame.h"
#import "MainViewController.h"
#import "WinViewController.h"



@implementation GuessingGame

@synthesize answer;
@synthesize answers;
NSInteger gameGuess;
NSInteger gamesWon;
NSString *selectionNumber;
NSString *theAnswer;





-(void)getAnswerArray{
    answers = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"6", @"7", @"8", @"9", nil];
}

-(void)resetAnswer{
    [self getAnswerArray];
    int myIndex = arc4random_uniform(answers.count);
    answer = [answers objectAtIndex:myIndex];
    NSLog(@"The right answer is %@", self.answer);
}

-(void)runGame{
    gameGuess = 0;
    gamesWon = 0;
    self.showWinView = FALSE;
    
}

-(void)setKey{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"overage"];
    
}

-(void)tooManyGuesses{
    UIAlertView *overageAlert = [[UIAlertView alloc] initWithTitle:@"No More" message:@"You only have four guesses to get this cats number right!" delegate:nil cancelButtonTitle:@"Try again" otherButtonTitles:nil, nil];
    [overageAlert show];
}

-(void)winGame{

    gamesWon++;
    [[NSUserDefaults standardUserDefaults] setInteger:gamesWon forKey:@"gamesWon"];
    
    if (gamesWon>3) {
        gamesWon = 1;
    }
    
    if (gamesWon == 3) {
        self.showWinView = TRUE;
        self.win3 = TRUE;
    } else if (gamesWon == 2) {
        self.win2 = TRUE;
    } else if (gamesWon == 1) {
        self.win1 = TRUE;
    }
    
}



- (void)checkAnswer:(NSString *)selectionNumber forAnswer:(NSString *)answer {
    theAnswer = self.answer;
    if ([selectionNumber isEqualToString:theAnswer]) {
        self.isWinner = YES;
    } else {
        self.isWinner = NO;
    }
    
}





@end
