//
//  UIViewController+addSubscriber.h
//  bakerySystem
//
//  Created by 陈仁 on 11/18/14.
//  Copyright (c) 2014 陈仁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addSubscriber : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;
@property (strong, nonatomic) IBOutlet UITextField *zipTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *facebookTextField;
@property (strong, nonatomic) IBOutlet UITextField *streetTextField;
@property (strong, nonatomic) IBOutlet UITextField *twitterTextField;
@property (strong, nonatomic) IBOutlet UILabel *twitter;
@property (strong, nonatomic) IBOutlet UILabel *phone;
@property (strong, nonatomic) IBOutlet UILabel *zip;
@property (strong, nonatomic) IBOutlet UILabel *email;
@property (strong, nonatomic) IBOutlet UILabel *facebook;
@property (strong, nonatomic) IBOutlet UILabel *street;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property NSString * data;
@end
