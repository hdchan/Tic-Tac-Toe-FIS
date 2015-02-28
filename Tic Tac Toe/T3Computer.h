//
//  T3Computer.h
//  Tic Tac Toe
//
//  Created by Henry Chan on 2/24/15.
//  Copyright (c) 2015 Henry Chan. All rights reserved.
//

#import "T3Player.h"

@interface T3Computer : T3Player

- (NSInteger) makeMoveWithOpponentData:(NSArray *) opponentsClaimedPositions;

@end
