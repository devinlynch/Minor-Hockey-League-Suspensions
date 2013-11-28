//
//  Utils.m
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import "Utils.h"
#import "ServerResponse.h"

@implementation Utils
+(ServerResponse*) responseObjectFromJson: (NSData*) data andCmCode: (NSString*) cmCode{
    NSError *e = nil;
    NSDictionary *theJson = [NSJSONSerialization JSONObjectWithData: data options:0 error:&e];
    
    if(theJson == nil || e != nil){
        return [ServerResponse noResponse];
    } else{
        ServerResponse *res = [[ServerResponse alloc] init];
        res.cmCode = cmCode;
        NSString *returnCode = [theJson objectForKey:@"returnCode"];
        res.returnCode = [NSNumber numberWithInteger:returnCode.integerValue];
        
        NSDictionary *requestResults = [theJson objectForKey:@"requestResults"];
        res.requestResults = requestResults;
        
        res.returnMessage = [theJson objectForKey:@"returnMessage"];
        
        return res;
    }
}

+(NSString*) postRequestStringFromDictionary: (NSDictionary*) dict{
    NSString *returnS = @"";
    
    NSArray *keyArray =  [dict allKeys];
    int count = [keyArray count];
    for (int i=0; i < count; i++) {
        id tmp = [dict objectForKey:[ keyArray objectAtIndex:i]];
        
        if(i != count-1)
            returnS = [returnS stringByAppendingFormat:@"%@=%@&", [keyArray objectAtIndex:i], tmp];
        else
            returnS = [returnS stringByAppendingFormat:@"%@=%@", [keyArray objectAtIndex:i], tmp];
    }
    
    return returnS;
}
@end
