//
//  T3Computer.m
//  Tic Tac Toe
//
//  Created by Henry Chan on 2/24/15.
//  Copyright (c) 2015 Henry Chan. All rights reserved.
//

#import "T3Computer.h"

@implementation T3Computer

- (NSString *) name {

    return [NSString stringWithFormat:@"Computer %@",self.assignedShape];
    
}

- (NSInteger) makeMoveWithOpponentData:(NSArray *) opponentsClaimedPositions {
    
    NSLog(@"%@: Making a move here...", self.name);
    
    NSLog(@"%@: Okay your move!", self.name);
    
    return 1;
}

@end
