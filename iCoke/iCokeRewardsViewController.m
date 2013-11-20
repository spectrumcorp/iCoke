//
//  iCokeSecondViewController.m
//  iCoke
//
//  Created by Nathaniel on 2013.11.14.
//  Copyright (c) 2013 N. All rights reserved.
//

#import "iCokeRewardsViewController.h"

@interface iCokeRewardsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *rewardsArray;
@end

@implementation iCokeRewardsViewController
@synthesize rewardsArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
	self.rewardsArray = [self getRewards];
//	[[UINavigationBar appearance] setTintColor:[UIColor whiteColor]]; //text count
//	[[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:186.0f/255.0f green:0.0f/255.0f blue:4.0f/255.0f alpha:1.0f]]; //background bar
	[self viewWillDisappear:NO];

}
- (UIStatusBarStyle)preferredStatusBarStyle
{
	return UIStatusBarStyleLightContent;
}

// Called when the view is about to made visible. Default does nothing
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

// Called when the view is dismissed, covered or otherwise hidden. Default does nothing
- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (NSArray *)getRewards
{
	NSArray * rewards = [NSArray alloc];
	
	iCokeReward * reward = [[iCokeReward alloc] init];
	iCokeReward * reward2 = [[iCokeReward alloc] initWithID:2 withTitle:@"Toronto Raptops Tickets" withPoints:@"250000" withDescription:@"Catch all the NBA action!\nCheer for the Toronto Raptors right from the stands with a pair of game tickets. Grab a friend and choose from one game in 2013 or three different games in 2014 (total of four potential games).\n Watch the Toronto Raptors catch serious airtime as they defend their home turf. But hurry, these tickets are going fast! 3...2...1..." withImage:@"admit_one.jpeg"];
	iCokeReward * reward3 = [[iCokeReward alloc] initWithID:3 withTitle:@"Crab & Penguins Desktop Game" withPoints:@"5000" withDescription:@"Download and play the smash hit mobile adventure game on your desktop - Get the full experience on your computer's large display of the stunning graphics and super smooth run times." withImage:@"admit_one.jpeg"];

	return [rewards initWithObjects:reward, reward2, reward3, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.rewardsArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellIdentifier = @"SettingsCell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	iCokeReward *reward = [self.rewardsArray objectAtIndex:indexPath.row];
	
	[cell.textLabel setText:[reward title]];
	//NSLog(@"%@", [reward details]);
	[cell.detailTextLabel setText: [reward details]];
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	RewardViewController *rvc = [self.storyboard instantiateViewControllerWithIdentifier:@"RewardViewController"];
	rvc.reward = [self.rewardsArray objectAtIndex:indexPath.row];
	[self.navigationController pushViewController:rvc animated:YES];
}


@end
