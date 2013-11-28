//
//  ViewController.h
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Server.h"
@interface ViewController : UIViewController<ServerProtocol>
{
    Server *server;
    NSMutableArray *jurisdictions;
}

@end
