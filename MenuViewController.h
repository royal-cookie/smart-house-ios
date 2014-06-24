//
//  MenuViewController.h
//  smarthouse
//
//  Created by cookie on 23.06.14.
//  Copyright (c) 2014 cookie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UINavigationItem *menuNavigationBar;
@property (strong, nonatomic) NSArray* menuItems;

@end
