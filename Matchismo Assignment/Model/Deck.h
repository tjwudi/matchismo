//
//  Deck.h
//  Matchismo Assignment
//
//  Created by Apple Club on 10/23/14.
//  Copyright (c) 2014 Alibaba Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject


- (void)addCard:(Card*)card atTop:(BOOL)atTop;
- (void)addCard:(Card*)card;

- (Card*)drawRandomCard;

@end
