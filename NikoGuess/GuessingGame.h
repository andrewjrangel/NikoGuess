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
@property (nonatomic) NSInteger gameGuess;
@property (nonatomic) NSInteger maxGuess;
@property (nonatomic) NSInteger gameWin;
@property (nonatomic) NSInteger maxWin;
@property (strong, nonatomic) NSArray *answers;
@property (strong, nonatomic) NSString *answer;


-(void)checkAnswer: (NSString *) selectionButton;
-(void)buttonPress: (BOOL) isWinner;
-(void)runGame;
-(void)tooManyGuesses;
-(void)winGame;
-(void)keepTrying;
@end
