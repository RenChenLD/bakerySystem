//
//  UIViewController+Recepes.h
//  bakerySystem
//
//  Created by 陈仁 on 11/15/14.
//  Copyright (c) 2014 陈仁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@interface Recipes : UITableViewController< NSFetchedResultsControllerDelegate>
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController* fetchedResultsController;
@property (nonatomic, copy) NSString* reuseIdentifier;
@end
