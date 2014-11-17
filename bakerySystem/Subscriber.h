//
//  Subscriber.h
//  bakerySystem
//
//  Created by 陈仁 on 11/13/14.
//  Copyright (c) 2014 陈仁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Subscriber : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * street;
@property (nonatomic, retain) NSNumber * zip;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSNumber * phone;
@property (nonatomic, retain) NSString * twitter;
@property (nonatomic, retain) NSString * facebook;

@end
