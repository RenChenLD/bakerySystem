//
//  ViewController.m
//  bakerySystem
//
//  Created by 陈仁 on 11/11/14.
//  Copyright (c) 2014 陈仁. All rights reserved.
//

#import "ViewController.h"
#import "Subscriber.h"
#import "Subscribers.h"
#import "addSubscriber.h"
#import "Recipes.h"
@interface ViewController ()

@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated
{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    Subscribers *sub = [[Subscribers alloc]init];
    [self addChildViewController:sub];
    [self.view addSubview:sub.view];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
