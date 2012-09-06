//
//  RSSFeedListController.m
//  sample_rss
//
//  Created by kamado on 12/09/03.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RSSFeedListController.h"
#import "RSSFeedController.h"

#import "RSSChannel.h"
#import "RSSChannelManager.h"

@interface RSSFeedListController ()

@end

@implementation RSSFeedListController

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
    self.title = NSLocalizedString(@"RSSFeed List", nil);
}

//----------------------------------------------------------//
#pragma mark -- 画面の更新 --
//----------------------------------------------------------//

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self _updateNavigationItemAnimated:animated];
    [self _updateToolbarItemsAnimated:animated];
    
    for (UITableViewCell* cell in [self.tableView visibleCells]) {
        [self _updateCell:cell atIndexPath:[self.tableView indexPathForCell:cell]];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [[RSSChannelManager sharedManager].channels count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}


//----------------------------------------------------------//
#pragma mark -- Model methods --
//----------------------------------------------------------//

- (void)_updateCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath
{
    
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
    cell.textLabel.text = title;
    cell.textLabel.textColor = titleColor;
    
    // フィードURLの設定
    NSString* feedUrlString;
    feedUrlString = channel.feedUrlString;
    if ([feedUrlString length] == 0) {
        feedUrlString = @"(URLが設定されていません)";
    }
    cell.detailTextLabel.text = feedUrlString;
    
    
    // アクセサリの設定
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

//----------------------------------------------------------//
#pragma mark -- Bar Setting --
//----------------------------------------------------------//

- (void)_updateNavigationItemAnimated:(BOOL)animated
{
    UIBarButtonItem* addButton = [[UIBarButtonItem alloc] 
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                   target:self 
                                action:@selector(addAction)];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] 
                                    initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                    target:self 
                                   action:@selector(doneAction)];
    [self.navigationItem setLeftBarButtonItem:addButton animated:animated];
    [self.navigationItem setRightBarButtonItem:doneButton animated:animated];
}

- (void)_updateToolbarItemsAnimated:(BOOL)animated
{
    [self.navigationController setToolbarHidden:NO animated:animated];
    
    NSArray* toolbarItems;
    UIBarButtonItem* checkButton = [[UIBarButtonItem alloc] 
                                    initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                    target:self 
                                    action:nil];
    toolbarItems = [NSArray arrayWithObjects:checkButton, nil];
    [self setToolbarItems:toolbarItems animated:animated];
}

//----------------------------------------------------------//
#pragma mark -- Actions --
//----------------------------------------------------------//

- (void)doneAction
{
    // send message to delegate
    if ([_delegate respondsToSelector:@selector(feedListControllerDidFinish:)]) {
        [_delegate feedListControllerDidFinish:self];
    }
}

- (void)addAction
{
    RSSFeedController* controller;
    controller = [[RSSFeedController alloc] init];
    controller.delegate = self;
    
    [self.navigationController pushViewController:controller animated:YES];
}

//----------------------------------------------------------//
#pragma mark -- RSSFeedControllerDelegate --
//----------------------------------------------------------//

- (void)feedControllerDidSave:(RSSFeedController*)controller
{
    [self.navigationController popViewControllerAnimated:YES];
    
    // テーブルの行の数とチャンネルの数を比較する
    NSArray*    channels;
    channels = [RSSChannelManager sharedManager].channels;
    if ([self.tableView numberOfRowsInSection:0] != [channels count]) {
        // データの再読み込みを行う
        [self.tableView reloadData];
        
        // 最後の行を表示する
        NSIndexPath*    lastIndexPath;
        lastIndexPath = [NSIndexPath indexPathForRow:[channels count] - 1 inSection:0];
        [self.tableView scrollToRowAtIndexPath:lastIndexPath 
                atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    }
}

@end
