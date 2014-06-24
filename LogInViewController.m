//
//  LogInViewController.m
//  smarthouse
//
//  Created by cookie on 24.06.14.
//  Copyright (c) 2014 cookie. All rights reserved.
//

#import "LogInViewController.h"
#import "CollectionViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

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
    
    [self CreateNavigationBar];
    
    //------------
}

- (void) CreateNavigationBar{
    self.loginNavigation.leftBarButtonItem = nil;
    self.loginNavigation.rightBarButtonItem = [[UIBarButtonItem alloc]
                                               initWithTitle:@"Log In"
                                               style:UIBarButtonItemStyleBordered
                                               target:self
                                               action:@selector(loginUser:)];
}

- (void) loginUser:(id)sender{
    NSUserDefaults* userData = [NSUserDefaults standardUserDefaults];
    NSString* loginUser = self.emailEdit.text;
    NSString* passUser = self.passEdit.text;
    
    [userData setObject:loginUser forKey:@"loginUser"];
    [userData setObject:passUser forKey:@"passUser"];
    
    [userData synchronize];
    
    CollectionViewController* collectionView = [self.storyboard instantiateViewControllerWithIdentifier:@"CollectionViewController"];
    [self.navigationController pushViewController:collectionView animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
