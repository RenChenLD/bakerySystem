//
//  UIViewController+addMenus.m
//  bakerySystem
//
//  Created by Ren Chen on 12/7/14.
//  Copyright (c) 2014 陈仁. All rights reserved.
//

#import "addMenus.h"

@implementation addMenus
@synthesize menu, nameTextField, priceTextField;
-(void)viewWillAppear:(BOOL)animated
{
    if(menu != nil)
    {
        nameTextField.text = menu.name;
        priceTextField.text = menu.price;
        
    }
    
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    UIApplication *application = [UIApplication sharedApplication];
    id delegate = application.delegate;
    self.managedObjectContext = [delegate managedObjectContext];
    
    
    
}
-(IBAction)backgroundTap:(id)sender
{
    [nameTextField resignFirstResponder];
    [priceTextField resignFirstResponder];
    
}

- (IBAction)tapAdd:(id)sender {
    if(self.menu == nil)
    {
        //获取Subscribers的实体对象
        menu = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Menu class]) inManagedObjectContext:self.managedObjectContext];
    }
    //给person赋值
    menu.name = self.nameTextField.text;
    menu.price = self.priceTextField.text;

    menu.firstN = [NSString stringWithFormat:@"%c", [menu.name.uppercaseString characterAtIndex:0] ];
    
    //通过上下文存储实体对象
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    //返回上一层的view
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
@end
