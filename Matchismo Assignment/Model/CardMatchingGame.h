//
//  CardMatchingGame.h
//  Matchismo Assignment
//
//  Created by Apple Club on 10/24/14.
//  Copyright (c) 2014 Alibaba Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) NSMutableArray *matchHistory;

// designated initializer
- (instancetype) initWithCardCount:(NSUInteger)count
                         usingDeck:(Deck*) deck;

- (void) chooseCardAtIndex:(NSUInteger)index;
- (void) chooseCardAtIndex:(NSUInteger)index inMatchMode:(int)matchMode;
- (Card*) cardAtIndex:(NSUInteger)index;

@end
