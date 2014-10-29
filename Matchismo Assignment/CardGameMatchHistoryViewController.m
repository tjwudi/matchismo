//
//  CardGameMatchHistoryViewController.m
//  Matchismo Assignment
//
//  Created by Apple Club on 10/29/14.
//  Copyright (c) 2014 Alibaba Group. All rights reserved.
//

#import "CardGameMatchHistoryViewController.h"

@interface CardGameMatchHistoryViewController ()
@property (weak, nonatomic) IBOutlet UITextView *matchHistoryTextView;


@end

@implementation CardGameMatchHistoryViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self showHistory];
}

- (void)showHistory
{
    self.matchHistoryTextView.text = [self.game.matchHistory componentsJoinedByString:@"\n"];
    NSLog(@"%@", self.game.description);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
