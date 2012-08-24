//
//  Page2Controller.m
//  chap3_test
//
//  Created by kamado on 12/08/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Page2Controller.h"

@interface Page2Controller ()

@end

@implementation Page2Controller

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
    
    // add label @"こんばんは(ρ_-)ノ"
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.text = @"こんばんは(ρ_-)ノ"; 
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:label];
    
    // add botton to switch page1
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Go to Page1" forState:UIControlStateNormal];
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
    [self.view.window sendSubviewToBack:self.view];
}

@end
