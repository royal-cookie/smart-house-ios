//
//  ViewController.m
//  smarthouse
//
//  Created by cookie on 21.06.14.
//  Copyright (c) 2014 cookie. All rights reserved.
//

#import "CollectionViewController.h"
#import "ContentController.h"
#import "MenuViewController.h"
#import "CollectionViewControllerCell.h"
#import "LogInViewController.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    Cell* pCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"boxCell" forIndexPath:indexPath];

    pCell.deviceLabel.text = self.dataArray[indexPath.row];
    
    return pCell;
}

- (void) CreateNavigationBar{
    self.generalNavigation.leftBarButtonItem = [self CreateLeftNavigationBarItem];
    self.generalNavigation.rightBarButtonItem = [self CreateRightNavigationBarItem];
}

- (UIBarButtonItem*) CreateLeftNavigationBarItem{
    return [[UIBarButtonItem alloc]
            initWithBarButtonSystemItem:UIBarButtonSystemItemAction
            target:self
            action:@selector(menu:)];
}

- (UIBarButtonItem*) CreateRightNavigationBarItem{
    return [[UIBarButtonItem alloc]
            initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
            target:self
            action:@selector(addbox:)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
	self.dataArray = [[NSMutableArray alloc] init ];
    
    for (int i = 0; i != 5; ++i) {
        [self.dataArray insertObject:[NSString stringWithFormat:@"Device #%d", (i+1)] atIndex:i];
    }
    
    [self CreateNavigationBar];
    [self.navigationController setNavigationBarHidden:NO];
}

#pragma mark -
#pragma mark - go to smart-house item info
- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ContentController* content = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentController"];
    //set selected content
    content.contentLabelText = [NSString stringWithFormat:@"Device #%ld", (long)(indexPath.row + 1)];
    [self.navigationController pushViewController:content animated:YES];
    
}

#pragma mark -
#pragma mark - go to menu
- (void) menu:(id)sender{
    
    MenuViewController* menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
    [self.navigationController pushViewController:menuView animated:YES];
    
}

#pragma mark -
#pragma mark - add new smart-house item
- (void) addbox:(id)sender{
    
    NSUInteger index = self.dataArray.count;
    [self.dataArray addObject:[NSString stringWithFormat:@"Device #%ld", (index + 1)]];
    [self.collectionView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
