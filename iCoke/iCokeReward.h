//
//  iCokeReward.h
//  iCoke
//
//  Created by Nathaniel on 2013.11.17.
//  Copyright (c) 2013 N. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iCokeReward : NSObject{

}
@property int sid;
@property (nonatomic, copy) NSString *title;
@property int points;
@property (nonatomic, copy) NSString *details;

- (id)init;
- (id)initWithID:(int)ssid withTitle:(NSString*)title withPoints:(int)points withDescription:(NSString*)details;


@end
