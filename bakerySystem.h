//
//  bakerySystem.h
//  bakerySystem
//
//  Created by 陈仁 on 11/13/14.
//  Copyright (c) 2014 陈仁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface bakerySystem : NSManagedObject

@property (nonatomic, retain) NSString * admin;
@property (nonatomic, retain) NSString * password;

@end
