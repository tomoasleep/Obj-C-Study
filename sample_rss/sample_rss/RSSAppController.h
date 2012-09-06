//
//  RSSAppController.h
//  sample_rss
//
//  Created by kamado on 12/09/01.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSAppController : NSObject <UIApplicationDelegate>
{
    UIViewController* _ChannelListController;
    UIViewController* _navChannelListController;
}

@property (strong, nonatomic) UIWindow *window;
//初期化
+ (RSSAppController*)sharedController;

@end
