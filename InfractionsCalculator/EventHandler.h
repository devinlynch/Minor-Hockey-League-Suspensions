//
//  EventHandler.h
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//
//  Handles an event from the server

#import <Foundation/Foundation.h>
@class Event;
@interface EventHandler : NSObject

-(void) handleEvent: (Event*) event;

@end
