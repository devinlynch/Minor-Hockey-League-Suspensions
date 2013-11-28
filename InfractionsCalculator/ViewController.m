//
//  ViewController.m
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import "ViewController.h"
#import "FirstPageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    server = [[Server alloc] init];
    server.delegationListener = self;
    jurisdictions = [[NSMutableArray alloc] init];
    
    [self getJurisdictionsFromServer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void) getJurisdictionsFromServer{
    [server getInfractionsList];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

-(void) didGetJurisdictions:(NSArray *)_jurisdictions withError:(NSString *)error{
    if(error != nil) {
        NSLog(@"%@",error);
    } else{
        [jurisdictions removeAllObjects];
        [jurisdictions addObjectsFromArray:_jurisdictions];
        NSLog(@"Done loading from server");
        [self showInterface];
    }
}

-(void) showInterface{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^ {
        [self performSegueWithIdentifier:@"doneLoading" sender:self];
    }];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"Performing segue");
    FirstPageViewController *next = [segue destinationViewController];
    next.jurisdictions = jurisdictions;
}

@end
