//
//  GuessingGame.h
//  NikoGuess
//
//  Created by Ventura Rangel on 4/2/13.
//  Copyright (c) 2013 Andrews Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GuessingGame : NSObject

@property BOOL isWinner;
@property BOOL showWinView;
@property BOOL win1;
@property BOOL win2;
@property BOOL win3;


@property (nonatomic) NSInteger gameGuess;
@property (nonatomic) NSInteger gamesWon;
@property (strong, nonatomic) NSArray *answers;
@property (strong, nonatomic) NSString *answer;


-(void)buttonPress;
-(void)runGame;
-(void)tooManyGuesses;
-(void)winGame;
-(void)resetAnswer;
- (void)checkAnswer:(NSString *)selectionNumber forAnswer:(NSString *)answer;


@end
