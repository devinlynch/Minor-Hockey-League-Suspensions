//
//  ResultCell.h
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-27.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultCell : UITableViewCell

@property IBOutlet UILabel *occurenceLabel;
@property IBOutlet UILabel *descriptionLabel;

-(void) initWithSuspensionDescription: (NSString*) desc andIndex: (int) index;

@end
