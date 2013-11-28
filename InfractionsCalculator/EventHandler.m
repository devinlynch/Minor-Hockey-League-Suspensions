//
//  EventHandler.m
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import "EventHandler.h"

@implementation EventHandler

-(void) handleEvent: (Event*) event{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"Event handler should have overridden handleTheEvemt"] userInfo:nil];
}

@end
