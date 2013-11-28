//
//  ServerResponse.m
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import "ServerResponse.h"

@implementation ServerResponse
@synthesize requestResults,returnCode,returnMessage,cmCode;

+(ServerResponse*) noResponse{
    ServerResponse *r = [[ServerResponse alloc] init];
    r.returnCode = [NSNumber numberWithInt:1];
    return r;
}

@end
