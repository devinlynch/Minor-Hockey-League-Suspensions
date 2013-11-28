//
//  SimpleReactor.m
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import "SimpleReactor.h"
#import "Event.h"
#import "EventHandler.h"
@implementation SimpleReactor

-(id) init{
    self = [super init];
    handlers = [[NSMutableDictionary alloc] init];
    [self addHandlers];
    return self;
}

-(void) addHandlers {
    [handlers setObject:@"Cm2001EventHandler" forKey:@"2001"];
    [handlers setObject:@"Cm2002EventHandler" forKey:@"2002"];
}

-(void) dispatch: (Event*) event{
    NSString *className = [handlers objectForKey:event.type];
    Class c = NSClassFromString(className);
    EventHandler *handler = [[c alloc] init];
    [handler handleEvent:event];
}

@end
