//
//  ViewController.h
//  smarthouse
//
//  Created by cookie on 21.06.14.
//  Copyright (c) 2014 cookie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UICollectionViewController

@property (strong, nonatomic) NSMutableArray* dataArray;
@property (strong, nonatomic) IBOutlet UINavigationItem *generalNavigation;

@end
