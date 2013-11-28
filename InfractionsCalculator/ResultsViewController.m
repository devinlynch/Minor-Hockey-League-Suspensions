//
//  ResultsViewController.m
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-27.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import "ResultsViewController.h"
#import "ResultCell.h"
#import "Suspension.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController
@synthesize suspensions;
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
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return suspensions.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Suspension *susp = [suspensions objectAtIndex:indexPath.row];
    
    CGSize titleSize = [susp.suspensionDescription sizeWithFont:[UIFont fontWithName:@"Arial" size:12.0f] constrainedToSize:CGSizeMake(265.0f, MAXFLOAT)];
    
    return  titleSize.height + 50.0f;

}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.row;
    NSString *CellIdentifier = @"ResultCell";
    
    ResultCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil){
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"ResultCell" owner:nil options:nil];
        
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[ResultCell class]])
            {
                cell = (ResultCell *)currentObject;
                break;
            }
        }
    }
    
    Suspension *susp = [suspensions objectAtIndex:index];
    if(cell!=nil){
        [cell initWithSuspensionDescription:susp.suspensionDescription andIndex: (int)++index];
        return cell;
    } else{
        UITableViewCell *_cell;
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"SimpleTableItem"];
    
        _cell.textLabel.text = @"No suspensions found.";
        return cell;
    }
}

@end
