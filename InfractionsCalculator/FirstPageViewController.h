//
//  FirstPageViewController.h
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Server.h"
@class Jurisdiction;
@class Infraction;

@interface FirstPageViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, ServerProtocol>
{
    NSMutableArray *infractions;
    Jurisdiction *currentJurisdiction;
    Infraction *currentInfraction;
    int currentIndividual;
    Server *server;
    NSArray *suspensions;
}

@property NSArray *jurisdictions;
@property (strong, nonatomic) IBOutlet UITableView *jurisdictionsTableView;
@property (strong, nonatomic) IBOutlet UITableView *infractionsTableView;
@property (strong, nonatomic) IBOutlet UIButton *calcButton;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loader;

-(IBAction)didPressCalculate:(id)sender;
-(IBAction)didChangeSegment;
@end
