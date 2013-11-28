//
//  ResultCell.m
//  InfractionsCalculator
//
//  Created by Devin Lynch on 2013-11-27.
//  Copyright (c) 2013 Devin Lynch. All rights reserved.
//

#import "ResultCell.h"

@implementation ResultCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) initWithSuspensionDescription: (NSString*) desc andIndex: (int) index{
    self.occurenceLabel.text = [NSString stringWithFormat: @"Occurrence %d", index];
    self.descriptionLabel.text = desc;
}


@end
