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
#import "Model/CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *matchHistoryLabel;
@property (strong, nonatomic) Deck* deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic) int matchMode;
@end

@implementation CardGameViewController

- (int) matchMode {
    if (!_matchMode) {
        _matchMode = 2;
    }
    return _matchMode;
}

- (CardMatchingGame *)game {
    if (!_game) {
        _game = [self createGame];
    }
    return _game;
}

- (CardMatchingGame*)createGame {
    return [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                             usingDeck:[self createDeck]];
}

- (void)resetGame {
    self.game = [self createGame];
    [self updateUI];
}

-(Deck*) createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex inMatchMode:self.matchMode];
    [self updateUI];
}

- (IBAction)touchResetButton:(UIButton *)sender {
    [self resetGame];
}

- (IBAction)changeMatchModeSwitch:(UISegmentedControl *)sender {
    // Two APIs for UISegmentedControl that might be used
    // @property(nonatomic) NSInteger selectedSegmentIndex
    // titleForSegmentAtIndex for getting the title of one segment
    NSLog(@"Changing Mode");
    int selectedSegmentIndex = [sender selectedSegmentIndex];
    NSString *selectedMode = [sender titleForSegmentAtIndex:selectedSegmentIndex];
    if ([selectedMode isEqualToString:@"Match 2 Cards"]) {
        // Match 2 Cards
        self.matchMode = 2;
    }
    else {
        // Match 3 Cards
        self.matchMode = 3;
    }
    
    [self resetGame];
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int index = [self.cardButtons indexOfObject: cardButton];
        Card *card = [self.game cardAtIndex:index];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    if ([self.game.matchHistory count] > 0) {
        self.matchHistoryLabel.text = (NSString*)[self.game.matchHistory lastObject];

    }
}

- (NSString*)titleForCard:(Card*)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage*)backgroundImageForCard:(Card*)card
{
    NSString *imageName = card.isChosen ? @"cardfront" : @"cardback";
    return [UIImage imageNamed:imageName];
}


@end
