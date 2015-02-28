//
//  GameLogic.m
//  Tic Tac Toe
//
//  Created by Henry Chan on 2/26/15.
//  Copyright (c) 2015 Henry Chan. All rights reserved.
//

#import "GameLogic.h"
#import "Computer.h"
@interface GameLogic ()

@property (nonatomic, strong) Player *player1;
@property (nonatomic, strong) Player *player2;
@property (nonatomic, strong) NSArray *winningPaths;
@end

@implementation GameLogic
@synthesize currentPlayersTurn = _currentPlayersTurn;


- (void) setCurrentPlayersTurn:(Player *)player {
    
    NSLog(@"It is %@'s turn",player.name);
    
     _currentPlayersTurn = player; // setting instnace var to the var that is being passed
    
    
    if ([player isKindOfClass:[Computer class]]) {
        
        Computer *comp = (Computer*)player;
        
        comp.gameData = self.playerPositionData; // setting the current game data to the computer
        
        [self player:player selectsLocation:[comp move]]; // ask it to make a move
        
    }
    
   
    
}

- (Player *)currentPlayersTurn {
    
    if (!_currentPlayersTurn) _currentPlayersTurn = [[Player alloc] init];
    
    return _currentPlayersTurn;
}

- (id) initWithNumberofPlayers:(int)numberOfPlayers andDelegate:(id<GameLogicDelgate>)delegateObject{
    
    self = [super init];
    
    if (self) {
        
        self.gameLogicDelegate = delegateObject;
        
        self.playerPositionData = [[NSMutableDictionary alloc] init];
        
        self.player1 = [[Player alloc] init];
        
        if (numberOfPlayers == 0){
            self.player1 = [[Computer alloc] init];
            self.player2 = [[Computer alloc] init];
        } else if (numberOfPlayers == 2) {
            self.player1 = [[Player alloc] init];
            self.player2 = [[Player alloc] init];
            
        } else {
            self.player1 = [[Player alloc] init];
            self.player2 = [[Computer alloc] init];
            
        }
        
        
        
        NSUInteger randomizeShape = arc4random() % 2;
        
        if (randomizeShape == 0) {
            self.player1.shape = @"X";
            self.player2.shape = @"O";
        } else {
            self.player1.shape = @"O";
            self.player2.shape = @"X";
        }
        
        
        NSUInteger randomizeFirstPlayer = arc4random() % 2;
        
        if (randomizeFirstPlayer == 0) {
            
            self.currentPlayersTurn = self.player1;
            
        } else {
            self.currentPlayersTurn = self.player2;
        }
        
        //NSLog(@"%@", self.currentPlayersTurn.name);
    }
    
    return self;
}

- (void)swapTurns {
    
    if (self.currentPlayersTurn == self.player1) {
        
        self.currentPlayersTurn = self.player2;
        
    } else if (self.currentPlayersTurn == self.player2){
        
        self.currentPlayersTurn = self.player1;
        
    } else {
        
        NSLog(@"Something went wrong here: %@",self.currentPlayersTurn);
    }
    
}


- (void) player:(Player *)player selectsLocation:(int)location {
    
    NSLog(@"%@ setting %@ at location %d",player.name, player.shape, location);
    
    [self.playerPositionData setObject:player forKey:[NSNumber numberWithInt:location]];
    
    [self.currentPlayersTurn.claimedLocations addObject:[NSNumber numberWithInt:location]];
    
    
    
    
    for (NSArray *winningPath in self.winningPaths) {
        
        self.winningRow = [[NSMutableArray alloc] init]; // clear this variable
        
        for (NSNumber *playerLocation in self.currentPlayersTurn.claimedLocations) { // looping through the player's claimed locations
            
            
            if ([winningPath containsObject:playerLocation]) { // if there is a match for the row position then add it to the winning row
                
                [self.winningRow addObject:playerLocation];
                
            }
            
            
        }
        
        if (self.winningRow.count == 3) { // if the winning row array contains 3 values then we know the player has a three in a row
            
            self.winner = self.currentPlayersTurn;
            
            break;
        }
        
        
        
    }
    
    NSLog(@"Winning Row: %@", self.winningRow);
    
    
    if (self.winner && [self.playerPositionData count] < 9) {
        
    } else if (!self.winner && [self.playerPositionData count] == 9) { // draw
        
    } else {
        [self swapTurns];
    }
    
    NSLog(@"Got to end of this function");
    
}

- (NSArray *) winningPaths {
    
    if (!_winningPaths){
        
        /*
         1 | 2 | 3
         ---------
         4 | 5 | 6
         ---------
         7 | 8 | 9
         */
        
        _winningPaths = [[NSArray alloc] initWithObjects:
                         // horizontal
                         @[@1, @2, @3],
                         @[@4, @5, @6],
                         @[@7, @8, @9],
                         
                         // vertical
                         @[@1, @7, @4],
                         @[@2, @5, @8],
                         @[@3, @6, @9],
                         
                         // diagonal
                         @[@1, @5, @9],
                         @[@3, @5, @7],
                         
                         nil];
    }
    
    return  _winningPaths;
    
}


@end
