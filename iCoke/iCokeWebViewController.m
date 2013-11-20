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
	
	[self loadRequestFromString:@"https://m.icoke.ca/wap/register?execution=e1s1"];
	[[UINavigationBar appearance] setTintColor:[UIColor redColor]]; //text count
	[[UINavigationBar appearance] setBarTintColor:[UIColor clearColor]]; //background bar
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)loadRequestFromString:(NSString*)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
	NSURLRequest *urlRequest=[NSURLRequest requestWithURL:url cachePolicy:NSURLCacheStorageAllowedInMemoryOnly timeoutInterval:10];

    [self.webView loadRequest:urlRequest];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	NSLog(@"Error : %@",error);
}

- (IBAction)close:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
