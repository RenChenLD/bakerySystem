//
//  UIViewController+LoginView.h
//  bakerySystem
//
//  Created by 陈仁 on 11/13/14.
//  Copyright (c) 2014 陈仁. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol loginBtnClickedDelegate;
@interface LoginViewController :UIViewController
@property(nonatomic,weak) IBOutlet UITextField *admin;
@property(nonatomic,weak) IBOutlet UITextField *pwd;
@property(nonatomic,strong) id<loginBtnClickedDelegate> delegate0;
-(IBAction)loginPressed:(id)sender;
@end

@protocol loginBtnClickedDelegate <NSObject>

-(void)loginBtnClickWithAccount:(NSString *)admin andPassword:(NSString *)pwd;

@end