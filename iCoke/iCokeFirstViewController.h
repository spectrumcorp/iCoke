//
//  iCokeFirstViewController.h
//  iCoke
//
//  Created by Nathaniel on 2013.11.14.
//  Copyright (c) 2013 N. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iCokeFirstViewController : UIViewController<NSURLConnectionDelegate>{

	NSString *username;
	NSString *password;
    NSMutableData *responseData;
	NSMutableData *receivedData;

}

@end
