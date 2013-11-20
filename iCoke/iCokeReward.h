//
//  iCokeReward.h
//  iCoke
//
//  Created by Nathaniel on 2013.11.17.
//  Copyright (c) 2013 N. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iCokeReward : NSObject

@property int sid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *points;
@property (nonatomic, copy) NSString *details;
@property (nonatomic, copy) NSString *imageName;

- (id)init;
- (id)initWithID:(int)ssid withTitle:(NSString*)title withPoints:(NSString*)points withDescription:(NSString*)details withImage:(NSString*)imageName;


@end
