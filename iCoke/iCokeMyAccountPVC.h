//
//  iCokeMyAccountPVCViewController.h
//  iCoke
//
//  Created by Nathaniel on 2013.11.19.
//  Copyright (c) 2013 N. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCokeMyAccountVC.h"

@interface iCokeMyAccountPVC : UIViewController<UIPageViewControllerDataSource>
@property (strong, nonatomic) UIPageViewController *pageController;

@end
