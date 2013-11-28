//
//  Server.m
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import "Server.h"
#import "SimpleReactor.h"
#import "Utils.h"
#import "ServerResponse.h"
#import "Event.h"
#import "Utils.h"
@implementation Server

-(void) getInfractionsList{
    [self asynchronousPost:@"2001" withData:@"" andErrorCall:^(void){
        NSLog(@"Error connection to server for CM2001");
        [self.delegationListener didGetJurisdictions:nil withError:@"Could not connect to server"];
    }];
}

-(void) getSuspensionsForJurisdiction: (NSString*) jurisdicitonId andInfraction: (NSString*) infractionId andIndividualId: (NSString*) individualId{
    NSDictionary *request = [[NSDictionary alloc] initWithObjectsAndKeys: infractionId, @"infraction", individualId, @"individual",  jurisdicitonId, @"jurisdiction",  nil];
    NSString* requestString = [Utils postRequestStringFromDictionary:request];
    NSLog(@"Sending: %@", requestString);

    [self asynchronousPost:@"2002" withData:requestString andErrorCall:^(void){
        NSLog(@"Error connection to server for CM2002");
        [self.delegationListener didGetJurisdictions:nil withError:@"Could not connect to server"];
    }];
}


/**
 Does an asynchronous post request to the server.  Pass in the path to hit on the server, the data to append,
 and a block which will be called upon error.  This will return immediately.  The data from the server
 will be handled by its corresponding event handler which in turn will most likely call a delegate method
 of the ServerProtocol.
 */
-(void) asynchronousPost: (NSString*) cmCode withData: (NSString*) data andErrorCall:(block_t) errorCall{
    NSLog(@"Doing post:%@ with data: %@", cmCode, data);
    
    NSString *postBody = data;
    NSData *postData = [postBody dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSString *targetUrl = [NSString stringWithFormat:@"http://lmgr.myttm.ca/index.php?CM=%@", cmCode];
    NSURL *url = [NSURL URLWithString:targetUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    
    NSOperationQueue *queue =[[NSOperationQueue alloc] init];
    
    __block Server *myself = self;
    __block SimpleReactor *reactor = [[SimpleReactor alloc] init];
    __block block_t _errorCall = errorCall;
     __block NSString *_cmCode = cmCode;
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:
     ^(NSURLResponse *response, NSData *data, NSError *error) {
         
         NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
        int responseStatusCode = [httpResponse statusCode];
         
         if(responseStatusCode == 200){
             ServerResponse *res =[Utils responseObjectFromJson:data andCmCode:_cmCode];
             Event *e = [[Event alloc] initForType:cmCode];
             e.delegationListener = myself.delegationListener;
             e.response = res;
             [reactor dispatch:e];
         } else{
             NSLog(@"could not connect to server, doing error call");
             _errorCall();
         }
         
     }];
}


@end
