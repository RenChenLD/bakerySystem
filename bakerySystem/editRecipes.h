//
//  UIViewController+editRecipes.h
//  bakerySystem
//
//  Created by 陈仁 on 11/23/14.
//  Copyright (c) 2014 陈仁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"
@interface editRecipes :UIViewController 
@property (strong, nonatomic)IBOutlet UITextField *name;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) Recipe *recipe;
@end
