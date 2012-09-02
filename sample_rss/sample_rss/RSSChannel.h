//
//  RSSChannel.h
//  sample_rss
//
//  Created by kamado on 12/08/31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSChannel : NSObject

@property (readonly) NSString* identifier;
@property (strong) NSString* feedUrlString;
@property (strong) NSString* title;
@property (strong) NSString* link;
@property (readonly) NSMutableArray* items;

@end
