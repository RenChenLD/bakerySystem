//
//  UIViewController+addRecipeIngredients.m
//  bakerySystem
//
//  Created by 陈仁 on 11/23/14.
//  Copyright (c) 2014 陈仁. All rights reserved.
//

#import "addRecipeIngredients.h"

@implementation addRecipeIngredients
@synthesize name, amount, unit, type, ingredient;
-(void)viewDidLoad
{
    [super viewDidLoad];
    if (ingredient != nil) {
        name.text = ingredient.name;
        amount.text = ingredient.amount;
        unit.text = ingredient.measure_unit;
    }
    UIApplication *application = [UIApplication sharedApplication];
    id delegate = application.delegate;
    self.managedObjectContext = [delegate managedObjectContext];

}
-(IBAction)backgroundTap:(id)sender
{
    [name resignFirstResponder];
    [amount resignFirstResponder];
    [unit resignFirstResponder];
    
}

- (IBAction)tapAdd:(id)sender {
    if(self.ingredient == nil)
    {
        //获取ingredient的实体对象
        ingredient = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Ingredient class]) inManagedObjectContext:self.managedObjectContext];
    }
    //给ingredient赋值
    ingredient.name = self.name.text;
    ingredient.amount = self.amount.text;
    ingredient.measure_unit= self.unit.text;
    ingredient.firstN = [NSString stringWithFormat:@"%c", [ingredient.name.uppercaseString characterAtIndex:0] ];
    ingredient.type = type;
    //通过上下文存储实体对象
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    //返回上一层的view
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

@end
