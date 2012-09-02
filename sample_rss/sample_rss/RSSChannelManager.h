//
//  RSSChannelManager.h
//  sample_rss
//
//  Created by kamado on 12/08/31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSChannelManager : NSObject
{
    NSMutableArray* _channels;
}


@property (readonly) NSArray* channels;

+ (RSSChannelManager*) sharedManager;
- (void)save;
- (void)load;

@end
