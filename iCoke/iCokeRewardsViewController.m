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
}

- (NSArray *)getRewards
{
	NSArray * rewards = [NSArray alloc];
	
	iCokeReward * reward = [[iCokeReward alloc] init];
	
	
	return [rewards initWithObjects:reward, nil];
	
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
	return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.rewardsArray count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *cellIdentifier = @"SettingsCell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	iCokeReward *reward = [self.rewardsArray objectAtIndex:indexPath.row];
	
	[cell.textLabel setText:[reward title]];
	[cell.detailTextLabel setText: [reward details]];
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	RewardViewController *rvc =
		[self.storyboard instantiateViewControllerWithIdentifier:@"RewardViewController"];
	rvc.reward = [self.rewardsArray objectAtIndex:indexPath.row];
	[self.navigationController pushViewController:rvc animated:YES];
}

@end
