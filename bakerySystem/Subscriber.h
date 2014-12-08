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
@property (nonatomic, retain) NSString * zip;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSString * twitter;
@property (nonatomic, retain) NSString * facebook;
@property (nonatomic, retain) NSString * firstN;
@property (nonatomic, retain) NSString * subscribs;

@end
