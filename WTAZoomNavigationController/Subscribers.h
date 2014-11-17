//
//  UIViewController+Subscribers.h
//  bakerySystem
//
//  Created by 陈仁 on 11/15/14.
//  Copyright (c) 2014 陈仁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@protocol FetchedResultsControllerDataSourceDelegate

- (void)configureCell:(id)cell withObject:(id)object;
- (void)deleteObject:(id)object;

@end
@interface Subscribers : UIViewController<FetchedResultsControllerDataSourceDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSFetchedResultsController* fetchedResultsController;
@property (nonatomic, weak) id<FetchedResultsControllerDataSourceDelegate> delegate;
@property (nonatomic, copy) NSString* reuseIdentifier;

- (id)initWithTableView:(UITableView*)tableView;
- (id)selectedItem;

@end
