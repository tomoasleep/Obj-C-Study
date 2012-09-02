//
//  RSSAppController.m
//  sample_rss
//
//  Created by kamado on 12/09/01.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RSSAppController.h"
#import "RSSChannelManager.h"

@implementation RSSAppController

// RSSAppControllerの参照を入れておく共用static変数
static RSSAppController* _sharedInstance = nil;

+ (RSSAppController*)sharedController
{
    //共用static変数を返す
    return _sharedInstance;
}

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
    
    // to fix 
    //_channelListController = nil;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[RSSChannelManager sharedManager] save];
}

@end
