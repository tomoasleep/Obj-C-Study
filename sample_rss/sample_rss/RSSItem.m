//
//  RSSItem.m
//  sample_rss
//
//  Created by kamado on 12/08/31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RSSItem.h"

@implementation RSSItem

@synthesize identifier = _identifier;
@synthesize read = _read;

@synthesize title = _title;
@synthesize link = _link;
@synthesize itemDescription = _itemDescription;
@synthesize pubDate = _pubDate;

- (id)init
{
    self = [super init];
    if (!self)
    {
        return nil;
    }
    
    // 識別子を作成する
    CFUUIDRef uuid;
    uuid = CFUUIDCreate(NULL);
    _identifier = (__bridge NSString*)CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);

    return self;
}

- (void)encodeWithCoder:(NSCoder*)encoder
{
    // インスタンス変数をエンコードする
    [encoder encodeObject:_identifier forKey:@"identifier"];
    [encoder encodeBool:_read forKey:@"read"];
    [encoder encodeObject:_title forKey:@"title"];
    [encoder encodeObject:_link forKey:@"link"];
    [encoder encodeObject:_itemDescription forKey:@"itemDescription"];
    [encoder encodeObject:_pubDate forKey:@"pubDate"];
}

- (id)initWithCoder:(NSCoder*)decoder
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    // インスタンス変数をデコードする
    _identifier = [decoder decodeObjectForKey:@"identifier"];
    _read = [decoder decodeBoolForKey:@"read"];
    _title = [decoder decodeObjectForKey:@"title"];
    _link = [decoder decodeObjectForKey:@"link"];
    _itemDescription = [decoder decodeObjectForKey:@"itemDescription"];
    _pubDate = [decoder decodeObjectForKey:@"pubDate"];
    
    return self;
}

@end
