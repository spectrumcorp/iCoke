//
//  RewardViewController.h
//  iCoke
//
//  Created by Nathaniel on 2013.11.17.
//  Copyright (c) 2013 N. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCokeReward.h"

@interface RewardViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *rewardDescription;
@property (nonatomic,strong) iCokeReward *reward;
@end
