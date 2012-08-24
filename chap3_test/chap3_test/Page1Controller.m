//
//  Page1Controller.m
//  chap3_test
//
//  Created by kamado on 12/08/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Page1Controller.h"

@interface Page1Controller ()

@end

@implementation Page1Controller

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
    self.view.backgroundColor = [UIColor whiteColor];
    
    // add label @"Hello, NemuiWorld!"
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.text = @"Hello, NemuiWorld!"; 
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:label];
    
    // add botton to switch page2
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Go to Page2" forState:UIControlStateNormal];
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

- (void)buttonDidPush
{
    [self.view.window sendSubviewToBack:self.view];
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

@end
