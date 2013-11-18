//
//  iCokeReward.m
//  iCoke
//
//  Created by Nathaniel on 2013.11.17.
//  Copyright (c) 2013 N. All rights reserved.
//

#import "iCokeReward.h"

@implementation iCokeReward
@synthesize sid;
@synthesize title;
@synthesize points;
@synthesize details;
@synthesize imageName;

int sid;
NSString *title;
NSString *points;
NSString *details;
NSString *imageName;

- (id)init
{
    return [self initWithID:1234 withTitle:@"Title" withPoints:@"500" withDescription:@"Details!" withImage:@"admit_one.jpeg"];
}


- (id) initWithID:(int)ssid withTitle:(NSString*)tit withPoints:(NSString*)pts withDescription:(NSString*)desc withImage:(NSString*)img
{
    self = [super init];
    if(self) {
		sid = ssid;
        title = tit;
        points = pts;
		details = desc;
		imageName = img;
		//NSLog(@"_init: %@", self);
    }
    return(self);
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"\n%@, %@, %@, %@", title, points, details, imageName];
}

@end
