//
//  PlayingCard.m
//  Matchismo Assignment
//
//  Created by Apple Club on 10/23/14.
//  Copyright (c) 2014 Alibaba Group. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

+ (NSArray*) validSuits
{
    return @[@"♣️", @"❤︎", @"♦︎", @"♠︎"];
}

+ (NSArray*) rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6",
             @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger) maxRank
{
    return [[self rankStrings] count] - 1;
}

- (NSString*) contents
{
    return [[[PlayingCard rankStrings] objectAtIndex:self.rank] stringByAppendingString:self.suit];
}

- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit])
    {
        _suit = suit;
    }
}

- (NSString*) suit
{
    return _suit ? _suit : @"?";
}

- (void) setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

- (int) match:(NSArray *)cards
{
    int score = 0;
    
    if ([cards count] == 1) {
        id cardGot = [cards firstObject];
        if ([cardGot isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherCard = (PlayingCard *) cardGot;
            if ([self.suit isEqualToString: otherCard.suit]) {
                score = 1;
            }
            else if (self.rank == otherCard.rank) {
                score = 4;
            }
        }
        
    }
    
    return score;
}

@end
