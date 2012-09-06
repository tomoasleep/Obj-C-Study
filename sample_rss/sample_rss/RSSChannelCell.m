//
//  RSSChannelCell.m
//  sample_rss
//
//  Created by kamado on 12/09/03.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RSSChannelCell.h"

@implementation RSSChannelCell

@synthesize titleLabel = _titleLabel, feedLabel = _feedLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        // Initialization code
        return nil;
    }
    
    // make title Label
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.highlightedTextColor = [UIColor whiteColor];
    [self.contentView addSubview:_titleLabel];
    
    // make feed Label 
    _feedLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _feedLabel.font = [UIFont systemFontOfSize:12.0f];
    _feedLabel.textColor = [UIColor grayColor];
    _feedLabel.highlightedTextColor = [UIColor whiteColor];
    [self.contentView addSubview:_feedLabel];
    
    // make UIImageView
    //UIImage* image;
    //image = [UIImage imageNamed:@"numberBackground.png"];
    _numberBackgroundImageView = [[UIImageView alloc] initWithImage:nil];
    [self.contentView  addSubview:_numberBackgroundImageView];
    
    // make labels for showing number
    _numberLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _numberLabel.font = [UIFont boldSystemFontOfSize:17.0f];
    _numberLabel.textColor = [UIColor whiteColor];
    _numberLabel.backgroundColor = [UIColor clearColor];
    _numberLabel.textAlignment = UITextAlignmentCenter;
    [self.contentView  addSubview:_numberLabel];
    
    return self;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];

    // Configure the view for the selected state
    _titleLabel.highlighted = highlighted;
    _feedLabel.highlighted = highlighted;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    _titleLabel.highlighted = selected;
    _feedLabel.highlighted = selected;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // get size of the contentView of self
    CGRect bounds;
    bounds = self.contentView.bounds;
}

- (int)itemNumber
{
    // get number with label
    return [_numberLabel.text intValue];
}

-(void)setItemNumber:(int)itemNumber
{
    _numberLabel.text = [NSString stringWithFormat:@"%d", itemNumber];
    
    [self setNeedsLayout];
}

@end
