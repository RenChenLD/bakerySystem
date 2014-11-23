//
//  UIViewController+LoginView.m
//  bakerySystem
//
//  Created by 陈仁 on 11/13/14.
//  Copyright (c) 2014 陈仁. All rights reserved.
//

#import "LoginViewController.h"
#import "UserInfoModel.h"
#import "AppDelegate.h"
@interface LoginViewController()
@end

@implementation LoginViewController
@synthesize admin,pwd,delegate0;
-(IBAction)backgroundTap:(id)sender
{
    [admin resignFirstResponder];
    [pwd resignFirstResponder];
}

-(IBAction)loginPressed:(id)sender
{
    if([admin.text isEqualToString:@""]||[pwd.text isEqualToString:@""])
    {
        admin.text = @"Invalid!";
        
    }else
    {
        [[UserInfoModel shareUserInfoMode]checkUserAccountHadRegisterBeforeWithAccount:admin.text andCompletedBlock:^(BOOL isSuccess, UserInfoModel *userInfoModel, NSError *error)
         {
             if (isSuccess) {
                 if ([UserInfoModel shareUserInfoMode].isRegistered) {
                     dispatch_async(dispatch_get_main_queue(), ^{
                         
                         if ([delegate0 respondsToSelector:@selector(loginBtnClickWithAccount:andPassword:)]) {
                             [delegate0 loginBtnClickWithAccount:admin.text andPassword:pwd.text];
                         }
                         AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
                         [appDelegate resetRootViewControllerAfterLogined];
                     });
                     
                 }
             }
         }];

    }
}
-(void)loginBtnClickWithAccount:(NSString *)userAccount andPassword:(NSString *)userPwd
{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate resetRootViewControllerAfterLogined];
}
@end

