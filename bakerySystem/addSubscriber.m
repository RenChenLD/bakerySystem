//
//  UIViewController+addSubscriber.m
//  bakerySystem
//
//  Created by 陈仁 on 11/18/14.
//  Copyright (c) 2014 陈仁. All rights reserved.
//

#import "addSubscriber.h"
#import "Subscriber.h"
#import "Subscribers.h"
#import "Recipe.h"
#import "Recipes.h"
#import "ViewController.h"
@implementation addSubscriber
@synthesize nameTextField,phoneTextField,zipTextField,emailTextField,facebookTextField,twitterTextField,streetTextField, data,phone,email,street,facebook,twitter,zip;
-(void)viewWillAppear:(BOOL)animated
{
//    if ([data isEqualToString:@"Recipes"]) {
//        phoneTextField.hidden = true;
//        zipTextField.hidden = true;
//        emailTextField.hidden = true;
//        facebookTextField.hidden = true;
//        twitterTextField.hidden = true;
//        streetTextField.hidden = true;
//        phone.hidden =true;
//        email.hidden =true;
//        street.hidden =true;
//        facebook.hidden =true;
//        twitter.hidden =true;
//        zip.hidden =true;
//    }
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    UIApplication *application = [UIApplication sharedApplication];
    id delegate = application.delegate;
    self.managedObjectContext = [delegate managedObjectContext];
    
    if ([data isEqualToString:@"Recipes"]) {
        phoneTextField.hidden = true;
        zipTextField.hidden = true;
        emailTextField.hidden = true;
        facebookTextField.hidden = true;
        twitterTextField.hidden = true;
        streetTextField.hidden = true;
        phone.hidden =true;
        email.hidden =true;
        street.hidden =true;
        facebook.hidden =true;
        twitter.hidden =true;
        zip.hidden =true;
    }
    
    
}
-(IBAction)backgroundTap:(id)sender
{
    [nameTextField resignFirstResponder];
    [zipTextField resignFirstResponder];
    [streetTextField resignFirstResponder];
    [phoneTextField resignFirstResponder];
    [emailTextField resignFirstResponder];
    [facebookTextField resignFirstResponder];
    [twitterTextField resignFirstResponder];
}

- (IBAction)tapAdd:(id)sender {
    if ([data isEqualToString:@"Subscribers"]) {
        //获取Subscribers的实体对象
        Subscriber *person = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Subscriber class]) inManagedObjectContext:self.managedObjectContext];
        
        //给person赋值
        person.name = self.nameTextField.text;
        person.phone = self.phoneTextField.text;
        person.zip = self.zipTextField.text;
        person.email = self.emailTextField.text;
        person.facebook = self.facebookTextField.text;
        person.street = self.streetTextField.text;
        person.twitter = self.twitterTextField.text;
        person.firstN = [NSString stringWithFormat:@"%c", [person.name.uppercaseString characterAtIndex:0] ];

    }else
    {
        Recipe *entity =[NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Recipe class]) inManagedObjectContext:self.managedObjectContext];
        entity.name = self.nameTextField.text;
        entity.firstN =[NSString stringWithFormat:@"%c", [entity.name characterAtIndex:0]];
   
    }

                //通过上下文存储实体对象
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    //返回上一层的view
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
@end
