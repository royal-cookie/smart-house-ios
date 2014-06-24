//
//  AppDelegate.m
//  smarthouse
//
//  Created by cookie on 21.06.14.
//  Copyright (c) 2014 cookie. All rights reserved.
//

#import "AppDelegate.h"
#import "LogInViewController.h"
#import "CollectionViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self CheckInternetConnection];
    return TRUE;
}

#pragma mark -
#pragma mark - check connection

- (void) CheckInternetConnection{
    NSString* urlAddress = @"http://www.smart-house.url.ph";
    NSURL* url = [NSURL URLWithString:urlAddress];
    NSURLRequest* urlRequest = [NSURLRequest requestWithURL:url];
    NSOperationQueue* operationQueue = [[NSOperationQueue alloc] init ];
    
    self.loginError = false;
    self.inSystem = true;
    
    [NSURLConnection
     sendAsynchronousRequest:urlRequest
     queue:operationQueue
     completionHandler:^(
                         NSURLResponse* urlResponse,
                         NSData* urlData,
                         NSError* urlError){
         
         if (urlError == nil) {
             //if connection is exist
             if (![self CheckUserInSystem])
             {
                 //go to SingInViewController
                 NSLog(@"go to SignInViewController");
                 
                 [self loginUser];
             }
         }
         else {
             //connection is gone :C
             //go to ErrorVIewController
             NSLog(@"go to ErrorViewController");
             [self displayError];
         }
         
     }];
}

- (void) displayError{
    //UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
}

- (void) loginUser{
    NSLog(@"In (loginUser)");
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LogInViewController* loginController = [storyboard instantiateViewControllerWithIdentifier:@"LogInViewController"];
    UINavigationController* navigationController = [storyboard instantiateViewControllerWithIdentifier:@"NavigationController"];
    
    //[CollectionViewController.navigationController pushViewController:loginController animated:YES];
}

- (BOOL) CheckUserInSystem{
    
    NSUserDefaults* userData = [NSUserDefaults standardUserDefaults];
    NSString* login = [userData stringForKey:@"userLogin"];
    NSString* password = [userData stringForKey:@"userPassword"];
    
    if ((login) && (password))
        return TRUE;
    
    return FALSE;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
