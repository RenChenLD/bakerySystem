//
//  loginViewController.m
//  WebCam
//
//  Created by 陈仁 on 14-4-25.
//  Copyright (c) 2014年 陈仁. All rights reserved.
//

#import "WTALeftViewController.h"
#import "WTAContentViewController.h"
#import "WTAZoomNavigationController.h"
#import "Subscribers.h"
#import "Recipes.h"

NSString * const WTATableCellIdentifier = @"WTATableCellIdentifier";

@interface WTALeftViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *datasource;
@property (nonatomic, assign) BOOL didSelectInitialViewController;

@end

@implementation WTALeftViewController

#pragma mark - UIViewController Overrides
//初始化

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [self setDatasource:@[@"Subscribers", @"Recipes", @"Account", @"About.."]];
    }
    return self;
}
//界面已读取
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self tableView] registerClass:[UITableViewCell class] forCellReuseIdentifier:WTATableCellIdentifier];
}
//界面将显示
- (void)viewWillAppear:(BOOL)animated
{
    //    NSLog(@"Left Appearing");
    if (![self didSelectInitialViewController])
    {
        [self setDidSelectInitialViewController:YES];
        [self tableView:[self tableView] didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    }
}

//- (void)viewDidAppear:(BOOL)animated
//{
//    NSLog(@"Left Appeared");
//}
//
//- (void)viewWillDisappear:(BOOL)animated
//{
//    NSLog(@"Left will disappear");
//}
//
//- (void)viewDidDisappear:(BOOL)animated
//{
//    NSLog(@"Left did disappear");
//}

// For testing
//- (void)willMoveToParentViewController:(UIViewController *)parent
//{
//    [super willMoveToParentViewController:parent];
//    NSLog(@"%@ %@ %@", self, NSStringFromSelector(_cmd), parent);
//}
//
//- (void)didMoveToParentViewController:(UIViewController *)parent
//{
//    [super didMoveToParentViewController:parent];
//    NSLog(@"%@ %@ %@", self, NSStringFromSelector(_cmd), parent);
//}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self datasource] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:WTATableCellIdentifier forIndexPath:indexPath];
    
    [cell setBackgroundColor:[UIColor clearColor]];
    [[cell textLabel] setTextColor:[UIColor whiteColor]];
    [[cell textLabel] setText:[self datasource][[indexPath row]]];
    [cell setSelectedBackgroundView:[UIView new]];
    [[cell textLabel] setHighlightedTextColor:[UIColor purpleColor]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{    
        return 65.0;
}
#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    WTAContentViewController *contentViewController = [WTAContentViewController new];
    [[contentViewController navigationItem] setTitle:[self datasource][[indexPath row]]];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:contentViewController];
    
    if (indexPath.row == 0 )  {
//        cameraListViewController *clvc = [[cameraListViewController alloc]init];
//        [contentViewController.view addSubview:clvc.view];
//        [[self wta_zoomNavigationController] setContentViewController:navigationController];
//        [[self wta_zoomNavigationController] hideLeftViewController:YES];
//        [navigationController addChildViewController:clvc];
//        NSLog(@"rootview");
        Subscribers *s = [[Subscribers alloc]init];
        [contentViewController.view addSubview:s.view];
        [[self wta_zoomNavigationController] setContentViewController:navigationController];
        [[self wta_zoomNavigationController] hideLeftViewController:true];
        [navigationController addChildViewController:s];
    }else if (indexPath.row == 1)
    {
//        localViewController *lVC = [[localViewController alloc]init];
//        [contentViewController.view addSubview:lVC.view];
//        [[self wta_zoomNavigationController] setContentViewController:navigationController];
//        [[self wta_zoomNavigationController] hideLeftViewController:YES];
//        [navigationController addChildViewController:lVC];
//        NSLog(@"1");
   
//    }else if (indexPath.row == 2)
//    {
//        settingViewController *sVC = [[settingViewController alloc]init];
//        [contentViewController.view addSubview:sVC.view];
//        [[self wta_zoomNavigationController] setContentViewController:navigationController];
//        [[self wta_zoomNavigationController] hideLeftViewController:YES];
//        [navigationController addChildViewController:sVC];
//        NSLog(@"2");
//
        Recipes *r = [[Recipes alloc]init];
        [contentViewController.view addSubview:r.view];
        [[self wta_zoomNavigationController] setContentViewController:navigationController];
        [[self wta_zoomNavigationController] hideLeftViewController:true];
        [navigationController addChildViewController:r];

    }else if (indexPath.row == 2)
    {
//        userViewController *uV = [[userViewController alloc]init];
//        [contentViewController.view addSubview:uV.view];
//        [[self wta_zoomNavigationController] setContentViewController:navigationController];
//        [[self wta_zoomNavigationController] hideLeftViewController:YES];
//        [navigationController addChildViewController:uV];
//        NSLog(@"2");
    
    }else if(indexPath.row == 3)
    {
//        AboutViewController *aboutVC = [[AboutViewController alloc]init];
//        [contentViewController.view addSubview:aboutVC.view];
//        [[self wta_zoomNavigationController] setContentViewController:navigationController];
//        [[self wta_zoomNavigationController] hideLeftViewController:YES];
//        [navigationController addChildViewController:aboutVC];
//        NSLog(@"3");
    }
    
    
   
}

@end
