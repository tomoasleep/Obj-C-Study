//
//  FinishedController.m
//  tab_navigation_tableview
//
//  Created by kamado on 12/08/26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FinishedController.h"

@interface FinishedController ()

@end

@implementation FinishedController

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

- (id)init
{
    if (([super init])) {
        // setting tabbar's view
        self.title = @"Finished Task";
        self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"Finished Task" image:nil tag:1];
    }
    return self;
}

@end
