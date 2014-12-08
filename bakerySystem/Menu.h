//
//  Menu.h
//  bakerySystem
//
//  Created by Ren Chen on 12/7/14.
//  Copyright (c) 2014 陈仁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Menu : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * price;
@property (nonatomic, retain) NSString * firstN;

@end
