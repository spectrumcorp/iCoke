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

@interface iCokeAccountViewController ()
@property (nonatomic, strong) NSMutableData *responseData;
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, strong) NSURL *loginURL;
@property (nonatomic, strong) AFHTTPRequestOperationManager * manager;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UILabel *errorMessage;

@end

@implementation iCokeAccountViewController

- (void)viewDidLoad
{
	
    [super viewDidLoad];
	
	self.manager = [AFHTTPRequestOperationManager manager];
	self.loginURL = [NSURL URLWithString:@"https://m.icoke.ca/wap/main"];
	_errorMessage.text = @"";
	[[UINavigationBar appearance] setTintColor:[UIColor redColor]]; //text count

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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	[self.view endEditing:YES];
}

-(void)textFieldReturn:(UITextField *)curField
{
	if (curField == _password) {
        [curField resignFirstResponder]; //close keyboard for good
    } else if (curField == _username || curField == _phoneNumber) {
        [_password becomeFirstResponder]; //go to password field
    }
}

- (IBAction)login:(id)sender {
	NSString *areaCode;
	NSString *firstThree;
	NSString *lastFour;
	
	if ([[_phoneNumber text] length] == 10){
		areaCode = [[_phoneNumber text] substringWithRange:NSMakeRange(0, 3)];
		firstThree = [[_phoneNumber text] substringWithRange:NSMakeRange(3, 3)];
		lastFour = [[_phoneNumber text] substringWithRange:NSMakeRange(6, 4)];


		self.manager.securityPolicy.allowInvalidCertificates = YES;
		self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
		self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
		[self.manager.requestSerializer
		 setAuthorizationHeaderFieldWithUsername:@"basic_auth_username"
		 password:@"basic_auth_password"];
		NSMutableDictionary *parameters = [ NSMutableDictionary dictionaryWithDictionary:@{
									   @"mobile1":areaCode,
									   @"mobile2":firstThree,
									   @"mobile3":lastFour,
									   @"password":[_password text],
									   @"_eventId_submit":@"Login"
									   }];
			
		[self.manager POST:@"https://m.icoke.ca/wap/login?execution=e1s1" parameters:parameters
			  success:^(AFHTTPRequestOperation *operation, id responseObject) {
				  NSString *responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
				  NSLog(@"\n***RESPONSE***\n %@", responseString);
			  }
			  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
				  NSLog(@"\n***Error***\n %@", error);
				  _errorMessage.text = @"ERROR";
				  [_username resignFirstResponder];
				  [_phoneNumber resignFirstResponder];
				  [_password resignFirstResponder];
			  }
		 ];

		
		
		
	}else{
		_errorMessage.text = @"Invalid phone number";
		
		[_username resignFirstResponder];
		[_phoneNumber resignFirstResponder];
		[_password resignFirstResponder];

	}
	
}

- (IBAction)user_id_Switch:(id)sender {
	
	if (_username.hidden){
		[_username setHidden: NO];
		[_phoneNumber setHidden:YES];
	}else{
		[_username setHidden: YES];
		[_phoneNumber setHidden: NO];
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
}


@end