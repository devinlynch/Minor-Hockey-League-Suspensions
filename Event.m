//
//  Event.m
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import "Event.h"

@implementation Event
@synthesize type, response, delegationListener;

-(id) initForType: (NSString*) t {
    self = [self init];
    self.type = t;
    return self;
}

@end
