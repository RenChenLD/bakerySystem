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
@synthesize nameTextField,phoneTextField,zipTextField,emailTextField,facebookTextField,twitterTextField,streetTextField,phone,email,street,facebook,twitter,zip, person, subscibsText;
-(void)viewWillAppear:(BOOL)animated
{
    if(person != nil)
    {
        nameTextField.text = person.name;
        phoneTextField.text = person.phone;
        streetTextField.text = person.street;
        zipTextField.text = person.zip;
        emailTextField.text = person.email;
        facebookTextField.text = person.facebook;
        twitterTextField.text = person.twitter;
        subscibsText.text = person.subscribs;
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
    [zipTextField resignFirstResponder];
    [streetTextField resignFirstResponder];
    [phoneTextField resignFirstResponder];
    [emailTextField resignFirstResponder];
    [facebookTextField resignFirstResponder];
    [twitterTextField resignFirstResponder];
    [subscibsText resignFirstResponder];
}

- (IBAction)tapAdd:(id)sender {
     if(self.person == nil)
     {
        //获取Subscribers的实体对象
        person = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Subscriber class]) inManagedObjectContext:self.managedObjectContext];
     }
    //给person赋值
    person.name = self.nameTextField.text;
    person.phone = self.phoneTextField.text;
    person.zip = self.zipTextField.text;
    person.email = self.emailTextField.text;
    person.facebook = self.facebookTextField.text;
    person.street = self.streetTextField.text;
    person.twitter = self.twitterTextField.text;
    person.subscribs = self.subscibsText.text;
    person.firstN = [NSString stringWithFormat:@"%c", [person.name.uppercaseString characterAtIndex:0] ];
//    Recipe *re = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Recipe class]) inManagedObjectContext:self.managedObjectContext];
//    re.name = @"White Bread";
//    re.firstN = @"W";
    //通过上下文存储实体对象
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    //返回上一层的view
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
@end
