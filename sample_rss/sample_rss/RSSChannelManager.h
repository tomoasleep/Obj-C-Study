//
//  RSSChannelManager.h
//  sample_rss
//
//  Created by kamado on 12/08/31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RSSChannel;

@interface RSSChannelManager : NSObject
{
    NSMutableArray* _channels;
}


@property (readonly) NSArray* channels;

+ (RSSChannelManager*) sharedManager;

- (void)save;
- (void)load;

- (void)addChannel:(RSSChannel*)channel;
- (void)insertChannel:(RSSChannel*)channel atIndex:(unsigned int)index;
- (void)removeChannelAtIndex:(unsigned int)index;
- (void)moveChannelAtIndex:(unsigned int)fromIndex toIndex:(unsigned int)toIndex;

@end
