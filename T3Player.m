//
//  T3Player.m
//  Tic Tac Toe
//
//  Created by Henry Chan on 2/6/15.
//  Copyright (c) 2015 Henry Chan. All rights reserved.
//

#import "T3Player.h"

@implementation T3Player

- (NSMutableArray *) claimedLocations {
    
    if (!_claimedLocations) _claimedLocations = [[NSMutableArray alloc] init];
    
    return  _claimedLocations;
    
}

- (NSString *) name {
    
    if (!_name) _name = [NSString stringWithFormat:@"Player %@", self.assignedShape]; // returning default name of "Player assignedShape"
    
    return  _name;
    
}

@end
