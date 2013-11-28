//
//  FirstPageViewController.m
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-26.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import "FirstPageViewController.h"
#import "Jurisdiction.h"
#import "Infraction.h"
#import "ResultsViewController.h"
@interface FirstPageViewController ()

@end

@implementation FirstPageViewController
@synthesize jurisdictions,jurisdictionsTableView,infractionsTableView,segmentControl;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    jurisdictionsTableView.delegate=self;
    jurisdictionsTableView.dataSource=self;
    infractionsTableView.delegate=self;
    infractionsTableView.dataSource=self;

    server= [[Server alloc] init];
    server.delegationListener=self;
    infractions = [[NSMutableArray alloc] init];
    
    self.loader.hidden=true;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if([tableView isEqual:jurisdictionsTableView]){
        return jurisdictions.count;
    } else{
        return infractions.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:@"Identifier"];

    if (cell == nil) {

        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Identifier"];
    }
    
    if([aTableView isEqual:jurisdictionsTableView]){
        Jurisdiction *item = [jurisdictions objectAtIndex:indexPath.row];
        cell.textLabel.text = item.jurisdictionDescription;
    } else{
        Infraction *item = [infractions objectAtIndex:indexPath.row];
        cell.textLabel.text = item.infractionDescription;
    }
    cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
    cell.textLabel.numberOfLines = 0;
    cell.backgroundColor = [UIColor clearColor];
    cell.backgroundView.backgroundColor = [UIColor clearColor];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:12.0];
    return cell;
}

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if([aTableView isEqual:jurisdictionsTableView]){
        currentJurisdiction = [jurisdictions objectAtIndex:indexPath.row];
        [self updateInfractions];
    } else{
        currentInfraction = [infractions objectAtIndex:indexPath.row];
    }
}

-(void) updateInfractions{
    if(currentJurisdiction != nil){
        NSInteger i = segmentControl.selectedSegmentIndex;
        [infractions removeAllObjects];
        currentInfraction = nil;
        currentIndividual=(int)i;
        if(i==0){
            [infractions addObjectsFromArray:currentJurisdiction.playerInfractions];
        } else{
            [infractions addObjectsFromArray:currentJurisdiction.teamOfficialInfractions];
        }
        [infractionsTableView reloadData];        
        [infractionsTableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:NO];
    }
}

-(IBAction)didChangeSegment;
{
    [self updateInfractions];
}

-(IBAction)didPressCalculate:(id)sender;
{
    if(currentInfraction != nil && currentJurisdiction != nil){
        self.calcButton.enabled = false;
        self.loader.hidden=false;
        [server getSuspensionsForJurisdiction:currentJurisdiction.ID andInfraction:currentInfraction.ID andIndividualId:[NSString stringWithFormat:@"%d", currentIndividual]];
    }
}

-(void) didGetSuspensions:(NSArray *) _suspensions withError:(NSString *)error{
    if(error != nil){
        NSLog(@"Error: %@", error);
    } else{
        suspensions = _suspensions;
        [[NSOperationQueue mainQueue] addOperationWithBlock:^ {
            self.calcButton.enabled = true;
            self.loader.hidden=true;
            [self performSegueWithIdentifier:@"results" sender:self];
        }];
    }
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ResultsViewController *next = [segue destinationViewController];
    next.suspensions = suspensions;
}

@end
