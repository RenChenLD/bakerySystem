//
//  UIViewController+addRecipeIngredients.h
//  bakerySystem
//
//  Created by 陈仁 on 11/23/14.
//  Copyright (c) 2014 陈仁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ingredient.h"
@interface addRecipeIngredients : UIViewController 
@property(strong, nonatomic)IBOutlet UITextField *name;
@property(strong, nonatomic)IBOutlet UITextField *amount;
@property(strong, nonatomic)IBOutlet UITextField *unit;
@property NSString *type;
@property Ingredient *ingredient;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
