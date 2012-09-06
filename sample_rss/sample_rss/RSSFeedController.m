//
//  RSSFeedController.m
//  sample_rss
//
//  Created by kamado on 12/09/07.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RSSFeedController.h"

#import "RSSChannel.h"
#import "RSSChannelManager.h"

@interface RSSFeedController ()

@end

@implementation RSSFeedController

@synthesize delegate = _delegate;

//----------------------------------------------------------//
#pragma mark -- Initialize --
//----------------------------------------------------------//

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.title = NSLocalizedString(@"Feedの作成", nil);

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    _titleField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 200, 30)];
    _titleField.borderStyle = UITextBorderStyleRoundedRect;
    _urlField = [[UITextField alloc] initWithFrame:CGRectMake(10, 80, 200, 30)];
    _urlField.borderStyle = UITextBorderStyleRoundedRect;
    
    [self.view addSubview:_titleField];
    [self.view addSubview:_urlField];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self _updateNavigationItemAnimated:animated];
    [self _updateToolbarItemsAnimated:animated];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//----------------------------------------------------------//
#pragma mark -- DataSource Methods --
//----------------------------------------------------------//

- (void)_saveFeed
{
    RSSChannel* channel;
    
    if (!channel) {
        // make new channel
        channel = [[RSSChannel alloc] init];
        
        [[RSSChannelManager sharedManager] addChannel:channel];
    }
    
    channel.title = _titleField.text;
    channel.feedUrlString = _urlField.text;
    
    [[RSSChannelManager sharedManager] save];
    
}

//----------------------------------------------------------//
#pragma mark -- Bar Setting --
//----------------------------------------------------------//

- (void)_updateNavigationItemAnimated:(BOOL)animated
{
    UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc] 
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                   target:self 
                                action:@selector(cancelAction)];
    UIBarButtonItem* saveButton = [[UIBarButtonItem alloc] 
                                    initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                    target:self 
                                   action:@selector(saveAction)];
    [self.navigationItem setLeftBarButtonItem:cancelButton animated:animated];
    [self.navigationItem setRightBarButtonItem:saveButton animated:animated];
}

- (void)_updateToolbarItemsAnimated:(BOOL)animated
{
    [self.navigationController setToolbarHidden:YES animated:animated];
}

//----------------------------------------------------------//
#pragma mark -- Actions --
//----------------------------------------------------------//

- (void)cancelAction
{
    if ([_delegate respondsToSelector:@selector(feedControllerDidSave:)]) {
        [_delegate feedControllerDidSave:self];
    }
}

- (void)saveAction
{
    [self _saveFeed];
    
    if ([_delegate respondsToSelector:@selector(feedControllerDidSave:)]) {
        [_delegate feedControllerDidSave:self];
    }
}
@end
