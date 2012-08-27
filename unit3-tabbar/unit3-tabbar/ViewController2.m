//
//  ViewController2.m
//  unit3-tabbar
//
//  Created by kamado on 12/08/26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

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
    self.view.backgroundColor = [UIColor blackColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.text = @"こんばんは(ρ_-)ノ"; 
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:label];
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
    if ((self = [super init])) {
        //tabBar用設定
        self.title = @"こんばんわ";
        self.tabBarItem = 
            [[UITabBarItem alloc] initWithTitle:@"こんばんわ" image:nil tag:0];
    }
    return self;
}

@end
