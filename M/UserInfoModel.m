//
//  UserInfoModel.m
//  bakerySystem
//
//  Created by 陈仁 on 11/13/14.
//  Copyright (c) 2014 陈仁. All rights reserved.
//
#import "UserInfoModel.h"
#import "AppDelegate.h"
NSString *const USER_HAVE_LOGIN_BEFORE = @"userInfo.haveLoginBefore";
NSString *const USER__LOGIN_Token = @"userInfo.loginToken";
NSString *const USER__LOGIN_Account = @"userInfo.loginAccount";
UserInfoModel *userInfo = nil;

@implementation UserInfoModel
@synthesize isRegistered,isLogin,userPassword,userAccount,token;
+(UserInfoModel *) shareUserInfoMode
{
    @synchronized (userInfo)
    {
        if (userInfo == nil) {
            userInfo = [[UserInfoModel alloc]init];
        }
    }
    return userInfo;
}
#pragma init
+ (id)allocWithZone:(struct _NSZone *)zone
{
    @synchronized (userInfo)
    {
        if (userInfo == nil) {
            userInfo = [super allocWithZone:zone];
        }
    }
    return userInfo;
}
#pragma mark -- logout
- (void)userLogout
{
    [userInfo setupUserInfoAfterLogoutOrLoginError];
}
-(void)checkUserAccountHadRegisterBeforeWithAccount:(NSString *)_account andCompletedBlock:(UserLoginBlock)completedBlock
{
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc]init];
    NSManagedObjectModel   * model    = [[NSManagedObjectModel alloc]init];
    NSDictionary           * entities = [model entitiesByName];
    NSEntityDescription    * entity   = [entities valueForKey:@"Admin"];
    
    NSFetchRequest * fetch = [[NSFetchRequest alloc] init];
    [fetch setEntity: entity];
    NSArray *result = [context executeFetchRequest:fetch error:nil];
    BOOL flag;
    if (result!=nil) {
        flag=true;
    }else
        flag = false;
    
}
-(void)userLoginWithAccount:(NSString *)_account andPassword:(NSString *)_password andCompletedBlock:(UserLoginBlock)completedBlock
{
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc]init];
    NSManagedObjectModel   * model    = [[NSManagedObjectModel alloc]init];
    NSDictionary           * entities = [model entitiesByName];
    NSEntityDescription    * entity   = [entities valueForKey:@"Admin"];
    
    
    NSFetchRequest * fetch = [[NSFetchRequest alloc] init];
    [fetch setEntity: entity];
    NSArray *result = [context executeFetchRequest:fetch error:nil];
    
}
#pragma mark logout api
-(void)setupUserInfoAfterLogoutOrLoginError
{
    userInfo.token = nil;
    userInfo.isLogin = NO;
}
- (void)setUserAccount:(NSString *)_userAccount
{
    [[NSUserDefaults standardUserDefaults] setValue:_userAccount forKey:USER__LOGIN_Account];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (NSString *)userAccount
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:USER__LOGIN_Account];
}

- (void)setToken:(NSString *)token
{
    [[NSUserDefaults standardUserDefaults] setValue:token forKey:USER__LOGIN_Token];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (NSString *)token
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:USER__LOGIN_Token];
}
- (void)setUserInfoIsUnabridged:(BOOL)userInfoIsUnabridged
{
    [[NSUserDefaults standardUserDefaults] setBool:userInfoIsUnabridged forKey:@"userInfo.userInfoIsUnabridged"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (BOOL)userInfoIsUnabridged
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"userInfo.userInfoIsUnabridged"];
}

@end
