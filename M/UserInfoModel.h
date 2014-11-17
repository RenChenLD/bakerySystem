//
//  UserInfoModel.h
//  bakerySystem
//
//  Created by 陈仁 on 11/13/14.
//  Copyright (c) 2014 陈仁. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserInfoModel;
typedef void (^UserLoginBlock)(BOOL isSuccess, UserInfoModel *userInfoModel,NSError *error);

@interface UserInfoModel : NSObject 
/**
 isLogin,record user's status if login，
 return yes or no
 */
@property (assign , nonatomic) BOOL isLogin;

/**
 check if the account regeistered，
 return yes or no
 */
@property (assign , nonatomic) BOOL isRegistered;

/**
 Account
 */
@property (strong , nonatomic) NSString *userAccount;

/**
 Password
 */
@property (strong, nonatomic) NSString *userPassword;

/**
 token
 */
@property (strong, nonatomic) NSString *token;

/**
shared
 */
+(UserInfoModel *)shareUserInfoMode;

/**
 User login implement，
 */
- (void)userLoginWithAccount:(NSString *)_account andPassword:(NSString *)_password andCompletedBlock:(UserLoginBlock)completedBlock;

/**
 check if registered，
 */
- (void)checkUserAccountHadRegisterBeforeWithAccount:(NSString *)_account andCompletedBlock:(UserLoginBlock)completedBlock;

/**
 Logout implemrnt，
 */
- (void)userLogout;

@end
