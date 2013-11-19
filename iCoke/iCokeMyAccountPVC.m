//
//  iCokeMyAccountPVCViewController.m
//  iCoke
//
//  Created by Nathaniel on 2013.11.19.
//  Copyright (c) 2013 N. All rights reserved.
//

#import "iCokeMyAccountPVC.h"

@interface iCokeMyAccountPVC ()

@end

@implementation iCokeMyAccountPVC


- (void)viewDidLoad
{
    [super viewDidLoad];
	self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    
    iCokeMyAccountVC *initialViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(iCokeMyAccountVC *)viewController index];
    
    if (index == 0) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(iCokeMyAccountVC *)viewController index];
    
	
    index++;
    
    if (index == 5) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}

- (iCokeMyAccountVC *)viewControllerAtIndex:(NSUInteger)index {
	
	UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	iCokeMyAccountVC *childViewController = [sb instantiateViewControllerWithIdentifier:@"iCokeMyAccount"];
	

    
    return childViewController;
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return 5;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}

@end
