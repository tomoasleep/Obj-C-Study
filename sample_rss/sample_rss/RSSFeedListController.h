//
//  RSSFeedListController.h
//  sample_rss
//
//  Created by kamado on 12/09/03.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSSFeedListController : UITableViewController

@property (assign) id delegate;

@end


@interface NSObject (RSSFeedListControllerDelegate)

- (void)feedListControllerDidFinish:(RSSFeedListController*)controller;

@end
