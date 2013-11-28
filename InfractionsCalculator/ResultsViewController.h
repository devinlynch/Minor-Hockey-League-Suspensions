//
//  ResultsViewController.h
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-27.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView* tableView;
@property (weak) NSArray *suspensions;

@end
