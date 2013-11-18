//
//  iCokeSecondViewController.m
//  iCoke
//
//  Created by Nathaniel on 2013.11.14.
//  Copyright (c) 2013 N. All rights reserved.
//

#import "iCokeRewardsViewController.h"

@interface iCokeRewardsViewController ()

@end

@implementation iCokeRewardsViewController
@synthesize rewardsArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.tableView.dataSource = self;
	
	self.rewardsArray = [[NSArray alloc] initWithObjects:
						@"Always put your fears behind you and your dreams in front of you.",
						@"A relationship with no trust is like a cell phone with no service, all you can do is play games.",
						@"People should stop talking about their problem and start thinking about the solution.",
						@"Dear Chuck Norris, Screw you. I can grill burgers under water. Sincerely, Spongebob Squarepants.",
						@"My arms will always be open for you, they will never close, not unless you're in them.",
						nil];
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

//3
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.rewardsArray count];
}

//4
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	//5
	static NSString *cellIdentifier = @"SettingsCell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	//5.1 you do not need this if you have set SettingsCell as identifier in the storyboard (else you can remove the comments on this code)
	//if (cell == nil)
	//    {
	//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
	//   }
	
	//6
	NSString *tweet = [self.rewardsArray objectAtIndex:indexPath.row];
	//7
	[cell.textLabel setText:tweet];
	[cell.detailTextLabel setText:@"via Codigator"];
	return cell;
}

@end
