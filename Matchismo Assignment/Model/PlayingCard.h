//
//  PlayingCard.h
//  Matchismo Assignment
//
//  Created by Apple Club on 10/23/14.
//  Copyright (c) 2014 Alibaba Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray*) validSuits;
+ (NSUInteger) maxRank;

@end
