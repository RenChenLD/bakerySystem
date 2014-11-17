//
//  Ingredient.h
//  bakerySystem
//
//  Created by 陈仁 on 11/13/14.
//  Copyright (c) 2014 陈仁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Recipe;

@interface Ingredient : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * amount;
@property (nonatomic, retain) NSString * measure_unit;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) Recipe *belong;

@end
