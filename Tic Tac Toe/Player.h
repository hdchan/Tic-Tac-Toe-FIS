//
//  Player.h
//  Tic Tac Toe
//
//  Created by Henry Chan on 2/26/15.
//  Copyright (c) 2015 Henry Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, strong) NSString *  name;
@property (nonatomic, strong) NSString *  shape;
@property (nonatomic, strong) NSMutableArray *claimedLocations;

@end
