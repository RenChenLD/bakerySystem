//
//  UIViewController+LoginView.m
//  bakerySystem
//
//  Created by 陈仁 on 11/13/14.
//  Copyright (c) 2014 陈仁. All rights reserved.
//

#import "LoginViewController.h"
#import "UserInfoModel.h"
@interface LoginViewController()
@end

@implementation LoginViewController
@synthesize admin,pwd;
-(IBAction)backgroundTap:(id)sender
{
    [admin resignFirstResponder];
    [pwd resignFirstResponder];
}

-(IBAction)loginPressed:(id)sender
{
    [UserInfoModel shareUserInfoMode];
}
@end

