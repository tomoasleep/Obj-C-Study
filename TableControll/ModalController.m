//
//  ModalController.m
//  tab_navigation_tableview
//
//  Created by kamado on 12/08/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ModalController.h"

@interface ModalController ()

@end

@implementation ModalController

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

    // add label explain this page
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.text = @"こんばんは(ρ_-)ノ私はmodalです"; 
    
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:label];
    
    // add botton to close modal
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"close modal" forState:UIControlStateNormal];
    
    [button sizeToFit];
    CGPoint newpoint = self.view.center;
    newpoint.y += 50;
    button.center = newpoint;
    button.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [button addTarget:self
               action:@selector(buttonDidPush)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
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

- (void)buttonDidPush
{
    [self dismissModalViewControllerAnimated:YES];
}

@end