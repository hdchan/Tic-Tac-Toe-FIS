//
//  GameViewController.m
//  Tic Tac Toe
//
//  Created by Henry Chan on 2/26/15.
//  Copyright (c) 2015 Henry Chan. All rights reserved.
//

#import "GameViewController.h"
#import "GameLogic.h"

@interface GameViewController () <GameLogicDelgate>
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tileButton;
@property (strong, nonatomic) GameLogic *game;
@end

@implementation GameViewController

- (void) computerDidMove {
    [self updateUI];
}

- (IBAction)playerTouchesTile:(UIButton *)sender {
    
    [self.game player:self.game.currentPlayersTurn selectsLocation:(int)sender.tag]; // when a human player touches a tile then we'll send the data to the logic
    
    
    [self updateUI];
}

- (void) updateUI {
    
    
    
    for (UIButton *button in self.tileButton) {
        
        if (self.game.winner) button.enabled = NO;
        
        Player *playerData = [self.game.playerPositionData objectForKey:[NSNumber numberWithInteger:button.tag]];
        
        if ([playerData isKindOfClass:[Player class]] && playerData != nil) {
            // check to see if the game data contains a Player Object
            
            button.enabled = NO;
            
            [button setBackgroundColor:[UIColor lightGrayColor]];
            
            [button setTitle:playerData.shape forState:UIControlStateDisabled];
            
        } else {
            
            button.enabled = YES;
            
            [button setBackgroundColor:[UIColor whiteColor]];
            
            [button setTitle:nil forState:UIControlStateNormal];
            
        }
            
        
        
        
        
    }
    
}

- (IBAction)newGameButton:(id)sender {
    [self newGame];
}

- (void) newGame {
    self.game = nil;
    self.game = [[GameLogic alloc] initWithNumberofPlayers:1 andDelegate:self];
    [self updateUI];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self newGame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
