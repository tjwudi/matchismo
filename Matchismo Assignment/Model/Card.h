//
//  Card.h
//  Matchismo Assignment
//
//  Created by Apple Club on 10/23/14.
//  Copyright (c) 2014 Alibaba Group. All rights reserved.
//

@import Foundation;

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

- (int) match:(NSArray *) cards;

@end
