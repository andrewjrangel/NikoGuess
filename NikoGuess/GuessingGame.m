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

@synthesize answer;
@synthesize answers;
NSInteger gameGuess;
NSString *selectionNumber;





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
    [self resetAnswer];
    
}

-(void)setKey{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"overage"];
    
}

-(void)tooManyGuesses{
    UIAlertView *overageAlert = [[UIAlertView alloc] initWithTitle:@"No More" message:@"You only have four guesses to get this cats number right!" delegate:nil cancelButtonTitle:@"Try again" otherButtonTitles:nil, nil];
    [overageAlert show];
}

-(void)winGame{
    NSLog(@"winGame");
}

-(void)keepTrying{
    NSLog(@"Keep Trying");
}




//-(void)checkAnswer: (NSString *) selectionNumber{
//    if (selectionNumber == answer) {
//        NSLog(@"you win! in check answer");
//        NSLog(@"winner in CA selectionNumber =%@", selectionNumber);
//        self.isWinner = TRUE;
//    } else {
//        NSLog(@"you lose in check answer");
//        NSLog(@"loser in CA selectionNumber =%@", selectionNumber);
//
//        
//    }
//}
//
//-(void)buttonPress{
//    [self checkAnswer:selectionNumber];
//    gameGuess++;
//    
//    if (gameGuess >=4) {
//        [self tooManyGuesses];
//        NSLog(@"too many guesses");
//    } else if (self.isWinner == TRUE){
//        [self winGame];
//        NSLog(@"you win! in button press");
//    } else {
//        NSLog(@"you lost in button press");
//    }
//    
//}






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
