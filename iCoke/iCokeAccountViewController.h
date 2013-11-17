//
//  iCokeFirstViewController.h
//  iCoke
//
//  Created by Nathaniel on 2013.11.14.
//  Copyright (c) 2013 N. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iCokeAccountViewController : UIViewController<NSURLConnectionDelegate>
{
	__weak IBOutlet UITextField *username;
	__weak IBOutlet UITextField *password;
	__weak IBOutlet UITextField *phoneNumber;
    NSMutableData *responseData;
	NSMutableData *receivedData;
	NSURL *loginURL;
}

@end
