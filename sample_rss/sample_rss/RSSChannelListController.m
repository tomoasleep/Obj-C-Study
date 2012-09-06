//
//  RSSChannelListController.m
//  sample_rss
//
//  Created by kamado on 12/09/01.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RSSChannelListController.h"
#import "RSSFeedListController.h"

#import "RSSChannelManager.h"
#import "RSSChannel.h"
#import "RSSItem.h"

#import "RSSChannelCell.h"

@interface RSSChannelListController ()

@end

@implementation RSSChannelListController

// property
@synthesize delegate = _delegate;

//----------------------------------------------------------//
#pragma mark -- Initialize --
//----------------------------------------------------------//

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

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
    
    [self _init];
    return self;
}

- (void)_init
{
    //共通の初期化処理
    self.title = NSLocalizedString(@"Channel List", nil);
}

//----------------------------------------------------------//
#pragma mark -- View methods --
//----------------------------------------------------------//

- (void)loadView
{
    [super loadView];
    // setting: instances of the View
//    UITableView* tableview = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
//    tableview.delegate = self;
//    UIView* view;
//    view = [[UIView alloc] initWithFrame:CGRectZero];
//    
//    self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"view %@",self.tableView.delegate);
    NSLog(@"view %@",self.tableView.dataSource);
    
    //[self.view addSubview:self.tableView]; 
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self _updateNavigationItemAnimated:animated];
    [self _updateToolbarItemsAnimated:animated];
    // 選択されているセルを解除する
//    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow]
//                                  animated:animated];
    
    // セルの表示更新を行う
    for (UITableViewCell* cell in [self.tableView visibleCells]) {
        [self _updateCell:cell atIndexPath:[self.tableView indexPathForCell:cell]];
    }

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
#pragma mark -- Table methods --
//----------------------------------------------------------//

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[RSSChannelManager sharedManager].channels count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"UITableViewCell"];
    }
    
    [self _updateCell:cell atIndexPath:indexPath];
    
    return cell;
}


//----------------------------------------------------------//
#pragma mark -- Model methods --
//----------------------------------------------------------//

- (void)_updateCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath
{
    // セルのキャスト
    RSSChannelCell* channelCell;
    channelCell = (RSSChannelCell*)cell;
    
    // 指定された行のチャンネルの取得
    NSArray* channels;
    RSSChannel* channel = nil;
    channels = [RSSChannelManager sharedManager].channels;
    if (indexPath.row < [channels count]) {
        channel = [channels objectAtIndex:indexPath.row];
    }
    
    // タイトルの取得
    NSString* title;
    UIColor* titleColor;
    title = channel.title;
    titleColor = [UIColor blackColor];
    if ([title length] == 0) {
        title = @"名称未設定";
        titleColor = [UIColor grayColor];
    }
    channelCell.titleLabel.text = title;
    channelCell.titleLabel.textColor = titleColor;
    
    // フィードURLの設定
    NSString* feedUrlString;
    feedUrlString = channel.feedUrlString;
    if ([feedUrlString length] == 0) {
        feedUrlString = @"(URLが設定されていません)";
    }
    channelCell.feedLabel.text = feedUrlString;
    
    // 未読記事数の設定
    int itemNumber = 0;
    for (RSSItem* item in channel.items) {
        if (!item.read) {
            itemNumber++;
        }
    }
    channelCell.itemNumber = itemNumber;
    
    // アクセサリの設定
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

//----------------------------------------------------------//
#pragma mark -- Bar Setting --
//----------------------------------------------------------//

- (void)_updateNavigationItemAnimated:(BOOL)animated
{
    UIBarButtonItem* feedButton = [[UIBarButtonItem alloc] 
                                   initWithTitle:@"Feed"
                                   style:UIBarButtonItemStyleBordered
                                   target:self 
                                   action:@selector(feedAction)];
    UIBarButtonItem* renewButton = [[UIBarButtonItem alloc] 
                                    initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                    target:self 
                                    action:nil];
    [self.navigationItem setLeftBarButtonItem:feedButton animated:animated];
    [self.navigationItem setRightBarButtonItem:renewButton animated:animated];
}

- (void)_updateToolbarItemsAnimated:(BOOL)animated
{
    [self.navigationController setToolbarHidden:NO animated:animated];
    
    NSArray* toolbarItems;
    UIBarButtonItem* checkButton = [[UIBarButtonItem alloc] 
                                    initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                    target:self 
                                    action:nil];
    toolbarItems = [NSArray arrayWithObjects:checkButton, nil];
    [self setToolbarItems:toolbarItems animated:animated];
}

//----------------------------------------------------------//
#pragma mark -- Update screen --
//----------------------------------------------------------//

//----------------------------------------------------------//
#pragma mark -- Actions --
//----------------------------------------------------------//

- (IBAction)feedAction
{
    // make controller
    RSSFeedListController* controller;
    controller = [[RSSFeedListController alloc] init];
    controller.delegate = self;
    
    // make Navigation Controller
    UINavigationController* navController;
    navController = [[UINavigationController alloc]
                     initWithRootViewController:controller];
    
    // show RSSFeedList as modalView
    [self presentModalViewController:navController animated:YES];
}

//----------------------------------------------------------//
#pragma mark -- RSSFeedListControllerDelegate --
//----------------------------------------------------------//

-(void)feedListControllerDidFinish:(RSSFeedListController*)controller
{
    [controller dismissModalViewControllerAnimated:YES];
}

@end
