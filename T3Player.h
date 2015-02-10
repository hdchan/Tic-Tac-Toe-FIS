//
//  T3Player.h
//  Tic Tac Toe
//
//  Created by Henry Chan on 2/6/15.
//  Copyright (c) 2015 Henry Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface T3Player : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *assignedShape;

@property (nonatomic, strong) NSMutableArray *claimedLocations; // This stores info on the player's claimed boxes

@end
