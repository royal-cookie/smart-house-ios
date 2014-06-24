//
//  AppDelegate.h
//  smarthouse
//
//  Created by cookie on 21.06.14.
//  Copyright (c) 2014 cookie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readwrite, nonatomic) BOOL loginError;
@property (readwrite, nonatomic) BOOL inSystem;

@end
