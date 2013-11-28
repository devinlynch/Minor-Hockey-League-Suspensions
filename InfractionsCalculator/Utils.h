//
//  Utils.h
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ServerResponse;
@interface Utils : NSObject
+(ServerResponse*) responseObjectFromJson: (NSData*) data andCmCode: (NSString*) cmCode;
+(NSString*) postRequestStringFromDictionary: (NSDictionary*) dict;
@end
