//
//  RSSChannelManager.m
//  sample_rss
//
//  Created by kamado on 12/08/31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RSSChannelManager.h"
#import "RSSChannel.h"

@implementation RSSChannelManager

@synthesize channels = _channels;
static RSSChannelManager* _sharedInstance = nil;

+ (RSSChannelManager*)sharedManager
{
    // インスタンスを作成する
    if (_sharedInstance) {
        _sharedInstance = [[RSSChannelManager alloc] init];
    }
    
    return _sharedInstance;
}

- (void)addChannel:(RSSChannel*)channel
{
    // 引数を確認する
    if (!channel) {
        return;
    }
    
    // チャンネルを追加する
    [_channels addObject:channel];
}

- (void)insertChannel:(RSSChannel*)channel atIndex:(unsigned int)index
{
    // 引数を確認する
    if (!channel) {
        return;
    }
    if (index > [_channels count]) {
        return;
    }
    
    // チャンネルを挿入する
    [_channels insertObject:channel atIndex:index];
}

- (void)removeChannelAtIndex:(unsigned int)index
{
    // 引数を確認する
    if (index > [_channels count]) {
        return;
    }
    
    // チャンネルを削除する
    [_channels removeObjectAtIndex:index];
}

- (void)moveChannelAtIndex:(unsigned int)fromIndex toIndex:(unsigned int)toIndex
{
    // 引数を確認する
    if (fromIndex > [_channels count] - 1) {
        return;
    }
    if (toIndex > [_channels count]) {
        return;
    }
    
    // チャンネルを移動する
    RSSChannel* channel;
    channel = [_channels objectAtIndex:fromIndex];
    [_channels removeObject:channel];
    [_channels insertObject:channel atIndex:toIndex];
}

- (NSString*)_channelDir
{
    // ドキュメントパスを取得する
    NSArray*    paths;
    NSString*   path;
    paths = NSSearchPathForDirectoriesInDomains(
                                                NSDocumentDirectory, NSUserDomainMask, YES);
    if ([paths count] < 1) {
        return nil;
    }
    path = [path stringByAppendingPathComponent:@".channel"];
    return path;
}

- (NSString*)_channelPath
{
    // channel.datパスを作成する
    NSString*   path;
    path = [[self _channelDir] stringByAppendingPathComponent:@"channel.dat"];
    return path;
}

- (void)save
{
    // ファイルマネージャを取得する
    NSFileManager* fileMgr;
    fileMgr = [NSFileManager defaultManager];
    
    // .channelディレクトリを作成する
    NSString* channelDir;
    channelDir = [self _channelDir];
    if (![fileMgr fileExistsAtPath:channelDir]) {
        NSError* error;
        [fileMgr createDirectoryAtPath:channelDir
           withIntermediateDirectories:YES 
                            attributes:nil 
                                 error:&error];
    }
    
    // チャンネルの配列を保存する
    NSString* channelPath;
    channelPath = [self _channelPath];
    [NSKeyedArchiver archiveRootObject:_channels toFile:channelPath];
}

- (void)load
{
    // ファイルパスを取得する
    NSString*   channelPath;
    channelPath = [self _channelPath];
    if (!channelPath ||
        ![[NSFileManager defaultManager] fileExistsAtPath:channelPath]) {
        return;
    }
    
    // チャンネルの配列を読み込む
    NSArray* channels;
    channels = [NSKeyedUnarchiver unarchiveObjectWithFile:channelPath];
    if (!channels) {
        return;
    }
    
    // チャンネルの配列を設定する
    [_channels setArray:channels];
}



@end
