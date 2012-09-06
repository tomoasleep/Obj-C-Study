//
//  RSSChannelCell.h
//  sample_rss
//
//  Created by kamado on 12/09/03.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSSChannelCell : UITableViewCell
{
    //subviews
    UIImageView* _numberBackgroundImageView;
    UILabel* _numberLabel;
}

@property (readonly) UILabel* titleLabel;
@property (readonly) UILabel* feedLabel;

@property int itemNumber;

@end
