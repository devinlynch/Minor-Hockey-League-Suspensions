//
//  Event.h
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//
// An event generated from a response from the server

#import <Foundation/Foundation.h>
#import "Server.h"

@class ServerResponse;

@interface Event : NSObject

@property(strong) NSString *type;
@property(strong) ServerResponse *response;
@property (retain) id<ServerProtocol> delegationListener;

-(id) initForType: (NSString*)t;

@end
