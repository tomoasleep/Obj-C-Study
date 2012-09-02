//
//  RSSItem.h
//  sample_rss
//
//  Created by kamado on 12/08/31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSItem : NSObject

@property (readonly) NSString* identifier;  // 識別子
@property (getter = isRead) BOOL read;  // 既読フラグ

@property (strong) NSString* title;
@property (strong) NSString* link;
@property (strong) NSString* itemDescription;
@property (strong) NSString* pubDate;


@end
