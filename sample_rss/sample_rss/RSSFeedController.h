//
//  RSSFeedController.h
//  sample_rss
//
//  Created by kamado on 12/09/07.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSSFeedController : UIViewController
{
    UITextField* _titleField;
    UITextField* _urlField;
}

@property (assign) id delegate;

@end

@interface NSObject (RSSFeedControllerDelegate)

- (void)feedControllerDidCancel:(RSSFeedController*)controller;
- (void)feedControllerDidSave:(RSSFeedController*)controller;

@end
