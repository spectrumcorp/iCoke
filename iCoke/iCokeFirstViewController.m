//
//  iCokeFirstViewController.m
//  iCoke
//
//  Created by Nathaniel on 2013.11.14.
//  Copyright (c) 2013 N. All rights reserved.
//

#import "iCokeFirstViewController.h"

@interface iCokeFirstViewController ()
@end


@implementation iCokeFirstViewController

- (void)viewDidLoad
{
	
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
	NSLog(@"button pressed...");

	//	NSString *postString = @"submit=1&emailAddress=Nathanielblumer@gmail.com&password=chillout";
	//	NSString *urlString = [NSString stringWithFormat:@"https:​/​/​secure.icoke.ca/​account/​login"];
	//	<form id=​"loginModel" action=​"" method=​"post">

	username = @"nathanielblumer@gmail.com";
	password = @"chillout";

	
	
	NSURL *url = [NSURL URLWithString:@"https:​/​/​secure.icoke.ca/​account/​login/"];
	NSDictionary *postDict = [NSDictionary dictionaryWithObjectsAndKeys:@"user", @"nathanielblumer@gmail.com",
							  @"password", @"chillout", nil];
	NSData *postData = [self encodeDictionary:postDict];
	
	// Create the request
	NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:url];
	[request setHTTPMethod:@"POST"];
	[request setValue:[NSString stringWithFormat:@"%d", postData.length] forHTTPHeaderField:@"Content-Length"];
	[request setValue:@"application/x-www-form-urlencoded charset=utf-8" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPBody:postData];
	
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request
																  delegate:self];
	[connection start];
	NSLog(request.description);
	[self connection:connection didReceiveResponse:postData];
	[self connection:connection didReceiveData:postData];
	
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[receivedData setLength:0];
	NSLog(@"data sent!!!");

}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[receivedData appendData:data];
	NSLog(@"data!!!!");

}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	NSLog(@"Succeeded! Received %d bytes of data", [receivedData length]);
	NSString *responseString = [[NSString alloc] initWithData:receivedData
													encoding:NSUTF8StringEncoding];
	
	NSLog(@"connection finished!!!");

	// Assume lowercase
	if ([responseString isEqualToString:@"true"]) {
		NSLog(@"SUCCESS!!!");
		return;
	}else{	// Deal with an error

		NSLog(@"ERROR!!!");

	}
}

- (NSData*)encodeDictionary:(NSDictionary*)dictionary {
	NSMutableArray *parts = [[NSMutableArray alloc] init];
	for (NSString *key in dictionary) {
        NSString *encodedValue = [[dictionary objectForKey:key] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *encodedKey = [key stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *part = [NSString stringWithFormat: @"%@=%@", encodedKey, encodedValue];
        [parts addObject:part];
	}
	NSString *encodedDictionary = [parts componentsJoinedByString:@"&"];
	return [encodedDictionary dataUsingEncoding:NSUTF8StringEncoding];
}

@end