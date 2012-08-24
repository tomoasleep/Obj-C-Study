//
//  AppDelegate.h
//  chap2_unit_test
//
//  Created by kamado on 12/08/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UIViewController* mainPageController_;
    UIViewController* secondPageController_;
}

@property (strong, nonatomic) UIWindow *window;

@end
