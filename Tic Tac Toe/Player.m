//
//  Player.m
//  Tic Tac Toe
//
//  Created by Henry Chan on 2/26/15.
//  Copyright (c) 2015 Henry Chan. All rights reserved.
//

#import "Player.h"

@implementation Player

- (NSString *) name {
    if (self.shape) {
        return [NSString stringWithFormat:@"Player %@", self.shape];
    } else {
        return @"No assigned shape";
    }
    
}
- (NSMutableArray *)claimedLocations     {
    
    if (!_claimedLocations ) _claimedLocations = [[NSMutableArray alloc] init];
    
    return _claimedLocations;
}


@end
