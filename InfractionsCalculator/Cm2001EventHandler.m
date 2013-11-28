//
//  Cm2001EventHandler.m
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import "Cm2001EventHandler.h"
#import "Event.h"
#import "ServerResponse.h"
#import "Jurisdiction.h"
#import "Infraction.h"
@implementation Cm2001EventHandler

-(void) handleEvent:(Event *)event{
    NSLog(@"Handling event Cm2001");
    if(event.response != nil) {
        NSDictionary *res = event.response.requestResults;
        
        if([event.response.returnCode isEqualToNumber:[NSNumber numberWithInt:0]]){
            // Does mappings from request to model objects
            NSArray *jurisdictions = [res objectForKey:@"jurisdictions"];
            NSMutableDictionary *mapOfJurisdictions = [[NSMutableDictionary alloc] init];
            for(NSDictionary * jur in jurisdictions) {
                Jurisdiction *jurisdiction = [[Jurisdiction alloc] initFromDictionary:jur];
                [mapOfJurisdictions setObject:jurisdiction forKey:jurisdiction.ID];

            }
            
            NSArray *infractions = [[res objectForKey:@"infractions"] objectForKey:@"jurisdictions"];
            if(infractions != nil){
                for(NSDictionary * inf in infractions) {
                    NSString *jurId = [inf objectForKey:@"id"];
                    Jurisdiction *jurisdiction = [mapOfJurisdictions objectForKey:jurId];
                    if(jurisdiction != nil){
                        NSArray *playerInfractions = [inf objectForKey:@"player-infractions"];
                        if(playerInfractions != nil){
                            for(NSDictionary * _inf in playerInfractions) {
                                Infraction *infraction = [[Infraction alloc] initFromDictionary:_inf];
                                if(infraction.infractionDescription != (id)[NSNull null] && infraction.infractionDescription.length != 0)
                                    [jurisdiction addPlayerInfraction:infraction];
                            }
                        }
                        
                        NSArray *teamOfficialInfractions = [inf objectForKey:@"team-official-infractions"];
                        if(teamOfficialInfractions != nil){
                            for(NSDictionary * _inf in teamOfficialInfractions) {
                                Infraction *infraction = [[Infraction alloc] initFromDictionary:_inf];
                                if(infraction.infractionDescription != (id)[NSNull null] && infraction.infractionDescription.length != 0)
                                    [jurisdiction addTeamOfficialInfractions:infraction];
                            }
                        }
                    }
                }
            }
            [event.delegationListener didGetJurisdictions:[mapOfJurisdictions allValues] withError:nil];
            return;
        }

        [event.delegationListener didGetJurisdictions:nil withError:@"API out of date"];

    }
}

@end
