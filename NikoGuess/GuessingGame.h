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
-(void)runGame;
-(void)checkAnswer: NSString;


@end
