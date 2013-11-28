//
//  Server.h
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ServerProtocol <NSObject>

-(void) didGetJurisdictions: (NSArray*) jurisdictions withError:(NSString*) error;
-(void) didGetSuspensions: (NSArray*) suspensions withError:(NSString*) error;

@end

typedef void (^block_t)();
@interface Server : NSObject

-(void) getInfractionsList;
-(void) getSuspensionsForJurisdiction: (NSString*) jurisdicitonId andInfraction: (NSString*) infractionId andIndividualId: (NSString*) individualId;

@property (weak) id<ServerProtocol> delegationListener;

@end
