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

int sid;
NSString *title;
int points;
NSString *details;



- (id)init
{
    return [self initWithID:1234 withTitle:@"Title" withPoints:500 withDescription:@"Cool reward!"];
}


- (id) initWithID:(int)ssid withTitle:(NSString*)tit withPoints:(int)pts withDescription:(NSString*)desc
{
    self = [super init];
    if(self) {
		sid = ssid;
        title = tit;
        points = pts;
		details = desc;
		NSLog(@"_init: %@", self);
    }
    return(self);
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"\n%@, %i, %@", title, points, details];
}

@end
