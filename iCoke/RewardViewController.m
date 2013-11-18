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
	[self.rewardDescription setText:[_reward details]];
	[self.rewardPoints setText:[_reward points]];
	[self.rewardTitle setText:[_reward title]];
	
	UIImage *myImage = [UIImage imageNamed:[_reward imageName]];
	[self.rewardImage setImage:myImage];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
	return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
