//
//  RSSChannel.m
//  sample_rss
//
//  Created by kamado on 12/08/31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RSSChannel.h"

@implementation RSSChannel

@synthesize identifier = _identifier;
@synthesize feedUrlString = _feedUrlString;
@synthesize title = _title;
@synthesize link = _link;
@synthesize items = _items;

- (id)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    // 識別子を作成する
    CFUUIDRef uuid;
    uuid = CFUUIDCreate(NULL);
    _identifier = (__bridge NSString*)CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    
    // _itemsを初期化する
    _items = [NSMutableArray array];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder*)encoder
{
    // インスタンス変数をエンコードする
    [encoder encodeObject:_identifier forKey:@"identifier"];
    [encoder encodeObject:_feedUrlString forKey:@"feedUrlString"];
    [encoder encodeObject:_title forKey:@"title"];
    [encoder encodeObject:_link forKey:@"link"];
    [encoder encodeObject:_items forKey:@"items"];
}

- (id)initWithCoder:(NSCoder*)decoder
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    // インスタンス変数をデコードする
    _identifier = [decoder decodeObjectForKey:@"identifier"];
    _feedUrlString = [decoder decodeObjectForKey:@"feedUrlString"];
    _title = [decoder decodeObjectForKey:@"title"];
    _link = [decoder decodeObjectForKey:@"link"];
    _items = [decoder decodeObjectForKey:@"items"];
    
    return self;
}

@end
