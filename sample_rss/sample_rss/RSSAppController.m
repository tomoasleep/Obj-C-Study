//
//  RSSAppController.m
//  sample_rss
//
//  Created by kamado on 12/09/01.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RSSAppController.h"
#import "RSSChannelListController.h"
#import "RSSChannelManager.h"

@implementation RSSAppController

@synthesize window = _window;

// RSSAppControllerの参照を入れておく共用static変数
static RSSAppController* _sharedInstance = nil;

//----------------------------------------------------------//
#pragma mark -- Accessor --
//----------------------------------------------------------//

+ (RSSAppController*)sharedController
{
    //共用static変数を返す
    return _sharedInstance;
}

//----------------------------------------------------------//
#pragma mark -- Initialize --
//----------------------------------------------------------//

-(id)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    //共用static変数に参照を渡す
    _sharedInstance = self;
    
    return self;
}

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    [[RSSChannelManager sharedManager] load];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    // make RSSChannelListController(RootViewController)
    _ChannelListController = [[RSSChannelListController alloc] init];
    
    // make NavigationController (add RootViewController)
    _navChannelListController = [[UINavigationController alloc]
                                 initWithRootViewController:_ChannelListController];
    _navChannelListController.view.frame = [[UIScreen mainScreen] bounds];
    
    [self.window addSubview:_navChannelListController.view];
    
    // to fix 
    //_channelListController = nil;
    [self.window makeKeyAndVisible];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[RSSChannelManager sharedManager] save];
}

@end
