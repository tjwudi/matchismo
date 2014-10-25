//
//  Card.m
//  Matchismo Assignment
//
//  Created by Apple Club on 10/23/14.
//  Copyright (c) 2014 Alibaba Group. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card


- (int) match:(NSArray*)cards
{
    int score = 0;
    
    for (Card* card in cards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

- (NSString*) description
{
    return self.contents;
}


@end
