//
//  Cm2002EventHandler.m
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import "Cm2002EventHandler.h"
#import "Event.h"
#import "ServerResponse.h"
#import "Suspension.h"
@implementation Cm2002EventHandler
-(void) handleEvent:(Event *)event{
    NSLog(@"Handling event Cm2002");
    if(event.response != nil) {
        NSDictionary *res = event.response.requestResults;
        NSLog(@"%@", res);
        if([event.response.returnCode isEqualToNumber:[NSNumber numberWithInt:0]]){
            NSDictionary *suspensions = [res objectForKey:@"suspensions"];
            if(suspensions != nil){
                NSMutableArray *arr = [[NSMutableArray alloc] init];
                for(NSString *val in [suspensions allValues]){
                    Suspension *suspension = [[Suspension alloc] init];
                    suspension.suspensionDescription = val;
                    [arr addObject:suspension];
                }
                
                if(arr.count >0){
                    [event.delegationListener didGetSuspensions:arr withError:nil];
                    return;
                }
            }
            
        }
    }
    [event.delegationListener didGetSuspensions:nil withError:@"API out of date"];
}
@end
