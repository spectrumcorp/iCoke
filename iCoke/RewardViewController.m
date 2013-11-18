//
//  RewardViewController.m
//  iCoke
//
//  Created by Nathaniel on 2013.11.17.
//  Copyright (c) 2013 N. All rights reserved.
//

#import "RewardViewController.h"

@interface RewardViewController ()

@end

@implementation RewardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.rewardDescription setText:self.description];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
