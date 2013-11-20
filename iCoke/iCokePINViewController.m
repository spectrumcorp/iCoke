//
//  iCokePINViewController.m
//  iCoke
//
//  Created by Nathaniel on 2013.11.15.
//  Copyright (c) 2013 N. All rights reserved.
//

#import "iCokePINViewController.h"

@interface iCokePINViewController () <MFMessageComposeViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *pin;

@end


@implementation iCokePINViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
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

-(IBAction)textFieldReturn:(id)sender
{
	[sender resignFirstResponder]; //close keyboard for good
}

- (IBAction)submitPin:(id)sender
{
	NSLog(@"%@", [_pin text]);
	//[[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"sms:42653"]];
    [self showSMS];
}

- (IBAction)usePhoto:(id)sender {
	UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
	
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
	{
		[imagePickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary]; //maybe other is prettier?
	}
	
	// image picker needs a delegate,
	[imagePickerController setDelegate:self];
	
	// Place image picker on the screen
	[self presentViewController:imagePickerController animated:YES completion:nil];
}

- (IBAction)takePhoto:(id)sender
{
	UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
	
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
	{
		[imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
	}
	
	// image picker needs a delegate,
	[imagePickerController setDelegate:self];
	
	// Place image picker on the screen
	[self presentViewController:imagePickerController animated:YES completion:nil];

	NSLog(@"TAKING PHOTO");
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	//put code for store image
}

// http://www.appcoda.com/ios-programming-send-sms-text-message/


- (void)showSMS {
    
    if(![MFMessageComposeViewController canSendText]) {
        UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your device doesn't support SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [warningAlert show];
        return;
    }
	
    NSArray * recipent = @[@"42653"];
    NSString * message = [NSString stringWithFormat:@"%@", _pin];
    
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
    messageController.messageComposeDelegate = self;
    [messageController setRecipients:recipent];
    [messageController setBody:message];
    
    // Present message view controller on screen
    [self presentViewController:messageController animated:YES completion:nil];
}


- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult) result
{
    switch (result) {
        case MessageComposeResultCancelled:
            break;
            
        case MessageComposeResultFailed:
        {
            UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to send SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [warningAlert show];
            break;
        }
            
        case MessageComposeResultSent:
            break;
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
