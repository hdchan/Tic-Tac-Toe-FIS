//
//  Computer.h
//  Tic Tac Toe
//
//  Created by Henry Chan on 2/26/15.
//  Copyright (c) 2015 Henry Chan. All rights reserved.
//

#import "Player.h"



@interface Computer : Player

@property (nonatomic, strong) NSDictionary *gameData;

- (int)move;

@end
