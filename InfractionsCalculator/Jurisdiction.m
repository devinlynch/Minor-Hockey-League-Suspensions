//
//  Jurisdiction.m
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import "Jurisdiction.h"
#import "Infraction.h"

@implementation Jurisdiction
@synthesize ID,jurisdictionDescription,name,playerInfractions,teamOfficialInfractions;

-(id) init{
    self=[super init];
    
    playerInfractions=[[NSMutableArray alloc] init];
    teamOfficialInfractions=[[NSMutableArray alloc] init];
    
    return self;
}

-(void) addPlayerInfraction:(Infraction *)infraction{
    [playerInfractions addObject:infraction];
}

-(void) addTeamOfficialInfractions:(Infraction *)infraction{
    [teamOfficialInfractions addObject:infraction];
}

-(id) initFromDictionary: (NSDictionary*) jur;
{
    self=[self init];
    
    jurisdictionDescription = [jur objectForKey:@"description"];
    ID = [jur objectForKey:@"id"];
    name = [jur objectForKey:@"name"];
    
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat: @"Jurisdiction: Description=%@", jurisdictionDescription];
}

@end
