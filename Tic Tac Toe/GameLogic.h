//
//  GameLogic.h
//  Tic Tac Toe
//
//  Created by Henry Chan on 2/26/15.
//  Copyright (c) 2015 Henry Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@class GameLogic;
@protocol GameLogicDelgate <NSObject>

@required

- (void) computerDidMove;

@end

@interface GameLogic : NSObject

@property (nonatomic,strong) Player *currentPlayersTurn;

@property (nonatomic, strong) NSMutableDictionary *playerPositionData;

@property (nonatomic, retain) id <GameLogicDelgate> gameLogicDelegate;

@property (nonatomic, strong) Player *winner;

@property (nonatomic, strong) NSMutableArray *winningRow;

- (void) player:(Player *)player selectsLocation:(int)location;
- (id) initWithNumberofPlayers:(int)numberOfPlayers andDelegate:(id<GameLogicDelgate>)delegateObject;
@end
