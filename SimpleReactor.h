//
//  SimpleReactor.h
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//
//  Handles the dispatching of events from the server.  This is just a simple implementation as there is not many event types.

#import <Foundation/Foundation.h>
@class Event;
@interface SimpleReactor : NSObject
{
    NSMutableDictionary *handlers;
}

-(void) dispatch: (Event*) event;

@end
