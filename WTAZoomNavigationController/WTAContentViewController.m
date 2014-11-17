//
//  loginViewController.m
//  WebCam
//
//  Created by 陈仁 on 14-4-25.
//  Copyright (c) 2014年 陈仁. All rights reserved.
//

#import "WTAContentViewController.h"

#import "WTAZoomNavigationController.h"


@interface WTAContentViewController ()

@end

@implementation WTAContentViewController
#pragma mark - UIViewController Overrides

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [self setupNavigationItem];
        
    }
    return self;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

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
//    NSLog(@"%@ %@ %@",self, NSStringFromSelector(_cmd), parent);
//}

#pragma mark - Instance Methods

- (void)setupNavigationItem
{
    UIBarButtonItem *menuBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"hamburger"] style:UIBarButtonItemStyleBordered target:self action:@selector(menuBarButtonItemPressed:)];
    [[self navigationItem] setLeftBarButtonItem:menuBarButtonItem];
}

- (void)menuBarButtonItemPressed:(id)sender
{
    [[self wta_zoomNavigationController] revealLeftViewController:YES];
}

@end
