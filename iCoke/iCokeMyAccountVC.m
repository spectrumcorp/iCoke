//
//  iCokeMyAccountVC.m
//  iCoke
//
//  Created by Nathaniel on 2013.11.19.
//  Copyright (c) 2013 N. All rights reserved.
//

#import "iCokeMyAccountVC.h"

@interface iCokeMyAccountVC ()

@end

@implementation iCokeMyAccountVC


- (void)viewDidLoad
{
    [super viewDidLoad];
	self.screenNumber.text = [NSString stringWithFormat:@"Screen #%d", self.index];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
