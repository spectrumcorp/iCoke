//
//  iCokeWebViewController.m
//  iCoke
//
//  Created by Nathaniel on 2013.11.16.
//  Copyright (c) 2013 N. All rights reserved.
//

#import "iCokeWebViewController.h"

@interface iCokeWebViewController ()

@end

@implementation iCokeWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	signupURL = [NSURL URLWithString:@"https://secure.icoke.ca/account/registration?execution=e1s1"];

	webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 320, 414)];
	NSURLRequest *request=[NSURLRequest requestWithURL:signupURL cachePolicy:NSURLCacheStorageNotAllowed timeoutInterval:10];
	[webView setScalesPageToFit:YES];
	[webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	NSLog(@"Error : %@",error);
}

- (IBAction)close:(id)sender {
	NSLog(@"Close window");
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
