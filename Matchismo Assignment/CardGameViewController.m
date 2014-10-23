//
//  CardGameViewController.m
//  Matchismo Assignment
//
//  Created by Apple Club on 10/23/14.
//  Copyright (c) 2014 Alibaba Group. All rights reserved.
//

#import "CardGameViewController.h"
#import "Model/Deck.h"
#import "Model/PlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) NSInteger flipCount;
@property (strong, nonatomic) Deck* deck;
@end

@implementation CardGameViewController

- (instancetype) init
{
    if (self = [super init]) {
        self.flipCount = 0;
    }
    return self;
}

- (Deck*) deck
{
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}

- (void) setFlipCount:(NSInteger)flipCount
{
    _flipCount = flipCount;
    [self.flipsLabel setText: [NSString stringWithFormat:@"Flips: %d", flipCount]];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    UIImage *newImage = nil;
    NSString *newTitie = nil;
    if ([[sender currentTitle] length]) {
        newImage = [UIImage imageNamed:@"cardback"];
        newTitie = @"";
    }
    else {
        newImage = [UIImage imageNamed:@"cardfront"];
        Card *newCard = [self.deck drawRandomCard];
        if (newCard) {
            newTitie = [[self.deck drawRandomCard] contents];
        }
        else {
            self.deck = [[PlayingCardDeck alloc] init];
        }
        
    }
    [sender setBackgroundImage:newImage forState:UIControlStateNormal];
    [sender setTitle:newTitie forState:UIControlStateNormal];
    self.flipCount ++;
}



@end
