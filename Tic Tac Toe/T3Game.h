//
//  T3Game.h
//  Tic Tac Toe
//
//  Created by Henry Chan on 2/6/15.
//  Copyright (c) 2015 Henry Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "T3Player.h"

@interface T3Game : NSObject

@property (nonatomic, strong) T3Player *currentPlayersTurn;

@property (nonatomic, strong) T3Player *winner;

@property (nonatomic, strong) NSMutableArray *unclaimablePositions;

@property (nonatomic, strong) NSMutableArray *winningRow; // we're going to use this data to update the UI to display the winning row

-(void) setShapeAt:(NSInteger *)location;



@end
