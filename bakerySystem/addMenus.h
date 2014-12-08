//
//  UIViewController+addMenus.h
//  bakerySystem
//
//  Created by Ren Chen on 12/7/14.
//  Copyright (c) 2014 陈仁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Menu.h"
@interface addMenus : UIViewController
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *priceTextField;
@property Menu *menu;
@end
