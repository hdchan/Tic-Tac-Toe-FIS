//
//  T3GameViewController.m
//  Tic Tac Toe
//
//  Created by Henry Chan on 2/6/15.
//  Copyright (c) 2015 Henry Chan. All rights reserved.
//

#import "T3GameViewController.h"
#import "T3Game.h"

@interface T3GameViewController () <T3GameDelegate>

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *boardButtons;

@property (strong, nonatomic) T3Game *game;

@property (weak, nonatomic) IBOutlet UILabel *gameMessage;


@end

@implementation T3GameViewController



- (IBAction)playerSelectedButton:(UIButton*)sender {
    
    [self setShape:sender];
    
}

- (void)setShape:(UIButton*)boardButton {
    
    NSLog(@"Current Player info %@",self.game.currentPlayersTurn.assignedShape);
    NSLog(@"%@",self.boardButtons);
    
    [boardButton setBackgroundColor:[UIColor lightGrayColor]];
    
    boardButton.enabled = NO;
    
    if ([self.game.currentPlayersTurn.assignedShape  isEqual: @"X"]) {
        
        [boardButton setTitle:@"X" forState:UIControlStateDisabled];
        
        [boardButton setTitleColor:[UIColor orangeColor] forState:UIControlStateDisabled];
        
    } else if ([self.game.currentPlayersTurn.assignedShape  isEqual: @"O"]) {
        
        NSLog(@"Putting it here");
        
        [boardButton setTitle:@"O" forState:UIControlStateDisabled];
        
        [boardButton setTitleColor:[UIColor blueColor] forState:UIControlStateDisabled];
        
    }
    
    NSInteger location = boardButton.tag;
    
    //NSLog(@"Button %lu touched",location);
    
    [self.game setShapeAt:&location];
    
    // updating game message
    
    if (self.game.unclaimablePositions.count == 9 && self.game.winner == nil) { // game is a draw
        
        self.gameMessage.text = [NSString stringWithFormat:@"Draw! Start a New Game!"];
        
        
    } else if (self.game.winner != nil) { // we have a winner!
        
        self.gameMessage.text = [NSString stringWithFormat:@"Tic-Tac-Toe! Three in a row! %@ Wins!", self.game.winner.name];
        
        //NSLog(@"%@",self.game.winningRow);
        
        for (UIButton *boardButton in self.boardButtons) {
            
            if ([self.game.winningRow containsObject:[NSNumber numberWithLong:boardButton.tag]]) {
                
                
                //NSLog(@"%ld", (long)location);
                [boardButton setBackgroundColor:[UIColor greenColor]];
                
            }
            
            if ([boardButton isEnabled]) { // disable all the other buttons
                
                boardButton.enabled = NO;
                
                
            }
            
        }
        
        
    } else { // moving along with the game...
        
        self.gameMessage.text = [NSString stringWithFormat:@"It is %@'s turn", self.game.currentPlayersTurn.name];
        
    }

}



- (IBAction)newGame:(id)sender {
    
    
    
    NSLog(@"Starting a new game");
    
    self.game = [[T3Game alloc] initWithDelegate:self]; // clear game data
    
    [self.game computersMove];
    
    for (UIButton *boardButton in self.boardButtons) { // reset UI buttons to original state
        
        boardButton.enabled = YES;
        
        [boardButton setTitle:@"" forState:UIControlStateDisabled];
        
        [boardButton setBackgroundColor:[UIColor whiteColor]];
        
    }
    
    self.gameMessage.text = [NSString stringWithFormat:@"It is %@'s turn", self.game.currentPlayersTurn.name];
    
    
}

#pragma mark - Computer's move 

- (void)moveMadeBy:(T3Computer *)computer atLocation:(NSInteger )location {
    
    NSLog(@"%@ made a move at %li",self.game,(long)location);
    //NSLog(@"%@",self.boardButtons);
    for (UIButton *button in self.boardButtons) {
        
        if (button.tag == location) {
            
            [self setShape:button];
            
            break;
        }
        
    }
    
}

#pragma mark - View Life Cycle


- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.gameMessage.text = nil;
    [self newGame:nil]; // starting a new game
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
