//
//  iCokeWebViewController.m
//  iCoke
//
//  Created by Nathaniel on 2013.11.16.
//  Copyright (c) 2013 N. All rights reserved.
//

#import "iCokeWebViewController.h"

@interface iCokeWebViewController ()

@property (nonatomic, strong) NSURL * signupURL;

@end

@implementation iCokeWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.signupURL = [NSURL fileURLWithPath:@"http://www.google.ca"];

	//webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 320, 414)];
	NSURLRequest *request=[NSURLRequest requestWithURL:self.signupURL cachePolicy:NSURLCacheStorageAllowedInMemoryOnly timeoutInterval:10];
//	[[UINavigationBar appearance] setTintColor:[UIColor redColor]]; //text count
//	[[UINavigationBar appearance] setBarTintColor:[UIColor clearColor]]; //background bar

	[_webView loadRequest:request];
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
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
