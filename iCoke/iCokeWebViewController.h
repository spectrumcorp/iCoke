//
//  iCokeWebViewController.h
//  iCoke
//
//  Created by Nathaniel on 2013.11.16.
//  Copyright (c) 2013 N. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iCokeWebViewController : UIViewController<NSURLConnectionDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)close:(id)sender;


@end
