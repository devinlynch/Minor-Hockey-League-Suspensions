//
//  Infraction.m
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import "Infraction.h"

@implementation Infraction
@synthesize code,infractionDescription,ID,type;

-(id) initFromDictionary: (NSDictionary*) inf{
    self = [super init];
    
    code = [inf objectForKey:@"code"];
    infractionDescription = [inf objectForKey:@"description"];
    ID = [inf objectForKey:@"id"];
    type = [inf objectForKey:@"type"];
    
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat: @"Infraction: Description=%@", infractionDescription];
}

@end
