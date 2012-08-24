//
//  MainPageController.m
//  chap2_unit_test
//
//  Created by kamado on 12/08/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainPageController.h"

@interface MainPageController ()

@end

@implementation MainPageController

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
    
    // add label
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.text = @"Hello, nemui!!";
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    
    // add buttom
    // button 1-1
    UIButton *button11 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button11.frame = CGRectMake(10, 10, 300, 300);
    [button11 setTitle:@"1-1"
              forState:UIControlStateNormal];
    [button11 addTarget:self
                 action:@selector(button11DidPush:) 
       forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button11];
    
    // button 1-1-1
    UIButton *button111 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button111.frame = CGRectMake(20, 20, 260, 100);
    [button111 setTitle:@"1-1-1"
              forState:UIControlStateNormal];
    [button111 addTarget:self
                 action:@selector(button111DidPush:) 
       forControlEvents:UIControlEventTouchUpInside];
    [button11 addSubview:button111];
    
    // button 1-1-2
    UIButton *button112 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button112.frame = CGRectMake(20, 180, 260, 100);
    [button112 setTitle:@"1-1-2"
              forState:UIControlStateNormal];
    [button112 addTarget:self
                 action:@selector(button112DidPush:) 
       forControlEvents:UIControlEventTouchUpInside];
    [button11 addSubview:button112];
    
    // button 1-1-2-1
    UIButton *button1121 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1121.frame = CGRectMake(10, 10, 95, 80);
    [button1121 setTitle:@"1-1-2-1"
              forState:UIControlStateNormal];
    [button1121 addTarget:self
                   action:@selector(button1121DidPush:) 
       forControlEvents:UIControlEventTouchUpInside];
    [button112 addSubview:button1121];
    
    // button 1-1-2-2
    UIButton *button1122 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1122.frame = CGRectMake(155, 10, 95, 80);
    [button1122 setTitle:@"1-1-2-2"
              forState:UIControlStateNormal];
    [button1122 addTarget:self
                   action:@selector(button1122DidPush:) 
       forControlEvents:UIControlEventTouchUpInside];
    [button112 addSubview:button1122];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Change Screen" forState:UIControlStateNormal];
    [button sizeToFit];
    
    CGPoint newPoint = self.view.center;
    newPoint.y += 50;
    
    button.center = newPoint;
    
    //[self.view addSubview:label];
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

- (void)button11DidPush:(id)sender { [self alertMessage:sender]; }
- (void)button111DidPush:(id)sender { [self alertMessage:sender]; }
- (void)button112DidPush:(id)sender { [self alertMessage:sender]; }
- (void)button1121DidPush:(id)sender { [self alertMessage:sender]; }
- (void)button1122DidPush:(id)sender { [self alertMessage:sender]; }

- (void)alertMessage:(UIButton*)button
{
    NSString* title = [NSString stringWithFormat:@"I'm %@", button.titleLabel.text];
    
    NSString* superViewName;
    if ([button.superview isKindOfClass:[UIButton class]]) {
        superViewName = ((UIButton*)button.superview).titleLabel.text;
    }else {
        superViewName = @"UiViewController";
    }
    
    NSMutableString* subViewsName = [[NSMutableString alloc] initWithCapacity:64];
    [subViewsName setString:@""];
    
    for (id view in  button.subviews ) {
        NSString*   addString;
        NSLog(@"class: %@",[view class]);
        if ([view isKindOfClass:[UIButton class]]) {
            addString = ((UIButton*)button.superview).titleLabel.text;
        }else if([view isKindOfClass:[UILabel class]]){
            addString = ((UILabel*)button.superview).text;
        }else {
            addString = [view description];
        }
        if ([subViewsName length] > 0) {
            [subViewsName appendString:@","];
        }
        [subViewsName appendString:addString];
    }
    NSString* message = 
    [NSString stringWithFormat:@"superview = %@\r\nsubview = %@", superViewName, subViewsName];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:nil 
                                          otherButtonTitles:@"OK", nil];
    [alert show];
}

@end
