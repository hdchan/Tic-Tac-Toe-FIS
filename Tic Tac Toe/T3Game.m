//
//  T3Game.m
//  Tic Tac Toe
//
//  Created by Henry Chan on 2/6/15.
//  Copyright (c) 2015 Henry Chan. All rights reserved.
//

#import "T3Game.h"


@interface T3Game ()

@property (nonatomic, strong) T3Player *playerX;

@property (nonatomic, strong) T3Player *playerO;

@property (nonatomic, strong) NSArray *winningPaths;



@end

@implementation T3Game

- (id) init {
    
    self = [super init];
    
    if (self) {
    
        // setting up new game
        
        self.unclaimablePositions = [[NSMutableArray alloc] init];
        
        self.winner = nil;
        
        self.playerX = [[T3Player alloc] init];
        
        self.playerX.assignedShape = @"X"; // assigning X's to player 1
        
        self.playerO = [[T3Player alloc] init];
        
        self.playerO.assignedShape = @"O"; // assigning O's to player 2
        
        
        NSUInteger randomize = arc4random_uniform(2);
        
        //NSLog(@"%lu", randomize);
        
        if (randomize == 0) {
            
            self.currentPlayersTurn = self.playerX;
            
        } else if (randomize == 1) {
            
            self.currentPlayersTurn = self.playerO;
            
        } else {
            
            self.currentPlayersTurn = self.playerX; // default if no random number is generated
            
        }
        
        NSLog(@"It is %@'s turn", self.currentPlayersTurn.name);
        
    }
    
    return self;
}



- (void) swapTurns {
    
    // alternating the player's turns
    
    if (self.currentPlayersTurn == self.playerX) {
        
        self.currentPlayersTurn = self.playerO;
        
    } else if (self.currentPlayersTurn == self.playerO) {
        
        self.currentPlayersTurn = self.playerX;
        
    }
    
    NSLog(@"It is %@'s turn", self.currentPlayersTurn.name);
    
}

- (void) setShapeAt:(NSInteger *)location {
    
    NSLog(@"Setting %@ at location: %ld", self.currentPlayersTurn.assignedShape, *location);
    
    [self.currentPlayersTurn.claimedLocations addObject:[NSNumber numberWithLong:*location] ]; // assigning current location to player's claimed locations
    
    //NSLog(@"%@", self.currentPlayersTurn.claimedLocations);
    
    [self.unclaimablePositions addObject:[NSNumber numberWithLong:*location]]; // we're also going to add this to a master array so that we can use it to reflect unclaimable tiles on the UI
    
    
    // we need to check if the current player's move resulted in a win
    
    for (NSArray *winningPath in self.winningPaths) {
        
        self.winningRow = [[NSMutableArray alloc] init]; // clear this variable
        
        for (NSNumber *location in self.currentPlayersTurn.claimedLocations) { // looping through the player's claimed locations
            
            
            if ([winningPath containsObject:location]) { // if there is a match for the row position then add it to the winning row
                
                [self.winningRow addObject:location];
                
            }
            
            
        }
        
        if (self.winningRow.count == 3) { // if the winning row array contains 3 values then we know the player has a three in a row
            
            self.winner = self.currentPlayersTurn;
            
            break;
        }
        
        
        
    }
    
    
    
    if (!self.winner) { // is winner set?
        
        [self swapTurns]; // if not then we'll just swap turns
        
    }
    
    
    
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
