//
//  CardMatchingGame.m
//  Matchismo Assignment
//
//  Created by Apple Club on 10/24/14.
//  Copyright (c) 2014 Alibaba Group. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;
@property (nonatomic, strong, readwrite) NSMutableArray *matchHistory;
@end

@implementation CardMatchingGame


-(NSMutableArray*) cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(NSMutableArray*) matchHistory
{
    if (!_matchHistory) {
        _matchHistory = [[NSMutableArray alloc] init];
    }
    return _matchHistory;
}

-(instancetype) initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i ++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }
            else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

- (Card*)cardAtIndex:(NSUInteger)index {
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index {
    [self chooseCardAtIndex:index inMatchMode:2];
}

- (void)chooseCardAtIndex:(NSUInteger)index
              inMatchMode:(int)matchMode {
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        }
        else {
            // match against other card
            NSMutableArray *chosenCards = [[NSMutableArray alloc] init];
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [chosenCards addObject: otherCard];
                }
            }
            
            int scoreDelta = self.score;
            BOOL matched = NO;
            
            if ([chosenCards count] == matchMode - 1) {
            
                int matchScore = [card match: chosenCards];
                if (matchScore) {
                    self.score += matchScore * MATCH_BONUS;
                    card.matched = YES;
                    for (Card *otherCard in chosenCards) {
                        otherCard.matched = YES;
                        matched = YES;
                    }
                }
                else {
                    self.score -= MISMATCH_PENALTY;
                    for (Card *otherCard in chosenCards) {
                        otherCard.chosen = NO;
                    }
                }   
            }
            
    
            card.chosen = YES;
            self.score -= COST_TO_CHOOSE;
            
            if ([chosenCards count] == matchMode - 1) {
                scoreDelta = self.score - scoreDelta;
                [chosenCards addObject:card];
                [self recordMatchHistoryOfCards:chosenCards
                                        matched:matched
                                     scoreDelta:scoreDelta];
            }
        }
    }

    
}




- (void)recordMatchHistoryOfCards:(NSArray*)cards
                          matched:(BOOL)matched
                       scoreDelta:(int)scoreDelta
{
    NSMutableString *cardsNameList = [[NSMutableString alloc] initWithString:@""];
    for (Card* card in cards) {
        [cardsNameList appendString: card.contents];
        if ([cards lastObject] != card) {
            [cardsNameList appendString:@" "];
        }
    }
    
    if (matched) {
        [self.matchHistory addObject:[NSString stringWithFormat:@"%@ matched, %d points credit!", cardsNameList, scoreDelta]];
    }
    else {
        [self.matchHistory addObject:[NSString stringWithFormat:@"%@ mismatched, %d points penalty", cardsNameList, abs(scoreDelta)]];
    }
}


@end
