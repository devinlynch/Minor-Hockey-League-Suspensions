//
//  Jurisdiction.h
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Infraction;
@interface Jurisdiction : NSObject

@property NSString* ID;
@property NSString* jurisdictionDescription;
@property NSString* name;
@property NSMutableArray* teamOfficialInfractions;
@property NSMutableArray* playerInfractions;

-(void) addPlayerInfraction:(Infraction *)infraction;
-(void) addTeamOfficialInfractions:(Infraction *)infraction;
-(id) initFromDictionary: (NSDictionary*) jur;

@end
