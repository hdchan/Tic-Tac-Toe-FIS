//
//  Computer.m
//  Tic Tac Toe
//
//  Created by Henry Chan on 2/26/15.
//  Copyright (c) 2015 Henry Chan. All rights reserved.
//

#import "Computer.h"

@implementation Computer

- (NSString *) name {
    if (self.shape) {
        return [NSString stringWithFormat:@"Computer %@", self.shape];
    } else {
        return @"No assigned shape";
    }
    
}

- (int)move  {
    
    
    NSUInteger location = 0;
    
    while (location == 0) {
        
        NSInteger randomizeLocation = arc4random() % 9 + 1;
        
        if (![self.gameData objectForKey:[NSNumber numberWithInteger:randomizeLocation]]) {
            
            location = randomizeLocation;
        }
        
        
    }
    
    NSLog(@"%@ says: Making Move at %lu", self.name, (unsigned long)location );
    
    return (int)location;
}

@end
