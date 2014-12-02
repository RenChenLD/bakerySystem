//
//  UIViewController+editRecipes.m
//  bakerySystem
//
//  Created by 陈仁 on 11/23/14.
//  Copyright (c) 2014 陈仁. All rights reserved.
//

#import "editRecipes.h"
#import "Ingredient.h"
@implementation editRecipes
@synthesize name,recipe;
-(void)viewWillAppear:(BOOL)animated
{
    if (recipe != nil) {
        name.text = recipe.name;
    }
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    UIApplication *application = [UIApplication sharedApplication];
    id delegate = application.delegate;
    self.managedObjectContext = [delegate managedObjectContext];
    

}
-(IBAction)backgroudTap:(id)sender
{
    [name resignFirstResponder];
}
-(IBAction)tapButton:(id)sender
{
    if(recipe == nil)
    {
        [self.managedObjectContext reset];
         recipe = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Recipe class]) inManagedObjectContext:self.managedObjectContext];
    }
    recipe.name = name.text;
    recipe.firstN = [NSString stringWithFormat:@"%c", [recipe.name.uppercaseString characterAtIndex:0] ];

    //通过上下文存储实体对象
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    //返回上一层的view
    [self.navigationController popViewControllerAnimated:YES];
}
@end
