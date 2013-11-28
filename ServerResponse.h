//
//  ServerResponse.h
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerResponse : NSObject

+(ServerResponse*) noResponse;
@property NSNumber* returnCode;             // 0 if success
@property NSString* returnMessage;
@property NSDictionary* requestResults;
@property NSString* cmCode;


@end
