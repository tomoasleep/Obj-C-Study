//
//  RSSChannelListController.m
//  sample_rss
//
//  Created by kamado on 12/09/01.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RSSChannelListController.h"

@interface RSSChannelListController ()

@end

@implementation RSSChannelListController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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

- (void)_init
{
    //共通の初期化処理
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

@end
