//
//  Infraction.h
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Infraction : NSObject

@property NSString* code;
@property NSString* infractionDescription;
@property NSString* ID;
@property NSString* type;

-(id) initFromDictionary: (NSDictionary*) inf;


@end
