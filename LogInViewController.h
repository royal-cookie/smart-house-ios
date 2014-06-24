//
//  LogInViewController.h
//  smarthouse
//
//  Created by cookie on 24.06.14.
//  Copyright (c) 2014 cookie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *emailEdit;
@property (strong, nonatomic) IBOutlet UITextField *passEdit;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UINavigationItem *loginNavigation;

@end
