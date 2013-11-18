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
    } else if (curField == username || curField == phoneNumber) {
        [password becomeFirstResponder]; //go to password field
    }
    //[sender resignFirstResponder];
}

- (IBAction)login:(id)sender {
	//	NSLog(@"\nU: %@	P: %@", [username text], [password text]);
	//kinda crazy that they've chosen to break up the phone number into 3 parts...
	NSString *areaCode;
	NSString *firstThree;
	NSString *lastFour;
	
	if ([[phoneNumber text] length] == 10){
		areaCode = [[phoneNumber text] substringWithRange:NSMakeRange(0, 3)];
		firstThree = [[phoneNumber text] substringWithRange:NSMakeRange(3, 3)];
		lastFour = [[phoneNumber text] substringWithRange:NSMakeRange(5, 4)];
	
		AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
		NSMutableDictionary *parameters = [ NSMutableDictionary dictionaryWithDictionary:@{
																   @"mobile1":areaCode,
																   @"mobile2":firstThree,
																   @"mobile3":lastFour,
																   @"password":[password text],
																   @"_eventId_submit":@"Login"
																   }];
		
		//	manager.requestSerializer = [AFJSONRequestSerializer serializer];
		//	manager.responseSerializer = [AFHTTPResponseSerializer serializer];
		
		[manager POST:@"https://m.icoke.ca/wap/login?execution=e1s1" parameters:parameters
			  success:^(AFHTTPRequestOperation *operation, id responseObject) {
				  NSString *responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
				  NSLog(@"***\nresponseString***\n %@", responseString);
			  }
			  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
				  NSLog(@"***\nError***\n %@", error);
			  }
		 ];
	}else{
		
	}

	NSLog(@"\npart1: %@	part2: %@ part3: %@", areaCode, firstThree, lastFour);
	
				
	
}

- (IBAction)user_id_Switch:(id)sender {
	
	if (username.hidden){
		[username setHidden: NO];
		[phoneNumber setHidden:YES];
	}else{
		[username setHidden: YES];
		[phoneNumber setHidden: NO];
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