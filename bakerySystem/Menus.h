//
//  UIViewController+Menu.h
//  bakerySystem
//
//  Created by Ren Chen on 12/7/14.
//  Copyright (c) 2014 陈仁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@interface Menus : UITableViewController<NSFetchedResultsControllerDelegate>
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController* fetchedResultsController;
@property (nonatomic, copy) NSString* reuseIdentifier;
@end
