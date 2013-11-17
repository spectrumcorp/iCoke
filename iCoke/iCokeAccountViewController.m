//
//  iCokeFirstViewController.m
//  iCoke
//
//  Created by Nathaniel on 2013.11.14.
//  Copyright (c) 2013 N. All rights reserved.
//

//	Mini cola bottle : http://findicons.com/files/icons/1509/world_of_copland_3/32/cola.png
//	Account, Rewards icon Visual Pharm - http://icons8.com/

#import "iCokeAccountViewController.h"
#import "AFHTTPRequestOperationManager.h"
@interface iCokeAccountViewController ()

@end


@implementation iCokeAccountViewController

- (void)viewDidLoad
{
	
    [super viewDidLoad];
	
	loginURL = [NSURL URLWithString:@"https:​/​/​secure.icoke.ca/​account/​login"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
	return UIStatusBarStyleLightContent;
}

-(void)textFieldReturn:(UITextField *)curField
{
	if (curField == password) {
        [curField resignFirstResponder]; //close keyboard for good
    } else if (curField == username) {
        [password becomeFirstResponder]; //go to password field
    }
    //[sender resignFirstResponder];
}


- (IBAction)login:(id)sender {
	//	NSLog(@"key: %@", [parameters allKeys]);
	//	NSLog(@"value: %@", [parameters allValues]);
	//	NSLog(@"\nU: %@	P: %@", [username text], [password text]);
	
	
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	NSMutableDictionary *parameters = [ NSMutableDictionary dictionaryWithDictionary:@{
									@"mobile1":@"514",
									@"mobile1":@"975",
									@"mobile1":@"6283",
									@"password":[password text],
									@"_eventId_submit":@"Login"

									   
//									@"submit": @"1",
//									@"emailAddress":[username text],
//									@"password":[password text],
//									@"rememberMe": @"true",
//									@"_rememberMe": @"on"
								}];

//	submit=1&emailAddress=nathanielblumer@gmail.com&password=chillout&rememberMe=true&_rememberMe=on 
	// POST TO THE SERVER! WHY DOESN'T THIS WORK?
	[manager POST:@"https://m.icoke.ca/wap/login?execution=e1s1?" parameters:parameters
		  success:^(AFHTTPRequestOperation *operation, id responseObject) {NSLog(@"\n***JSON***\n: %@", responseObject);}
		  failure:^(AFHTTPRequestOperation *operation, NSError *error) { NSLog(@"\n***Error***\n: %@", error);
	}];
 
	
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
	NSLog(@"Succeeded! Received %d bytes of data",[receivedData length]);
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

- (IBAction)signUp:(id)sender {
	
	NSString * storyboardName = @"Main";
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
	UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"webViewController"];
	[self presentViewController:vc animated:YES completion:nil];
	[self.navigationController pushViewController:vc animated:YES];

}

@end