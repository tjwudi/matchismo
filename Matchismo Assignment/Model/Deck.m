//
//  Deck.m
//  Matchismo Assignment
//
//  Created by Apple Club on 10/23/14.
//  Copyright (c) 2014 Alibaba Group. All rights reserved.
//

#import "Deck.h"


@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation Deck

-(void) addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    }
    else {
        [self.cards addObject:card];
    }
    
}
-(void) addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}


-(Card*) drawRandomCard
{
    Card *card = nil;
    
    if ([self.cards count] > 0) {
        unsigned index = arc4random() % [self.cards count];
        card = [self.cards objectAtIndex:index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return card;
}

-(NSMutableArray *) cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}


@end
