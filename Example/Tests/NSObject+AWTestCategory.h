//
//  NSObject+AWTestCategory.h
//  DynamicAssociatedProperties
//
//  Created by Victor Pavlychko on 03.10.2015.
//  Copyright © 2015 Victor Pavlychko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AWTestCategory)

@property (nonatomic, strong) NSMutableString *nsObjectTestCategoryStrongNonatomic;
@property (atomic,    strong) NSMutableString *nsObjectTestCategoryStrongAtomic;
@property (nonatomic, copy)   NSMutableString *nsObjectTestCategoryCopyNonatomic;
@property (atomic,    copy)   NSMutableString *nsObjectTestCategoryCopyAtomic;
@property (nonatomic, weak)   NSMutableString *nsObjectTestCategoryWeakNonatomic;
@property (atomic,    weak)   NSMutableString *nsObjectTestCategoryWeakAtomic;
@property (nonatomic, assign) NSMutableString *nsObjectTestCategoryAssignNonatomic;
@property (atomic,    assign) NSMutableString *nsObjectTestCategoryAssignAtomic;

@property (nonatomic, assign) NSInteger nsObjectTestCategoryValueNonatomic;
@property (atomic,    assign) NSInteger nsObjectTestCategoryValueAtomic;

@property (nonatomic, strong, getter=nsObjectTestCategoryCustomGetter_get) NSMutableString *nsObjectTestCategoryCustomGetter;
@property (nonatomic, strong, setter=nsObjectTestCategoryCustomSetter_set:) NSMutableString *nsObjectTestCategoryCustomSetter;
@property (nonatomic, strong, getter=nsObjectTestCategoryCustomAccessors_get, setter=nsObjectTestCategoryCustomAccessors_set:) NSMutableString *nsObjectTestCategoryCustomAccessors;

@property (nonatomic, assign) char               nsObjectTestCategory_char;
@property (nonatomic, assign) unsigned char      nsObjectTestCategory_unsigned_char;
@property (nonatomic, assign) short              nsObjectTestCategory_short;
@property (nonatomic, assign) unsigned short     nsObjectTestCategory_unsigned_short;
@property (nonatomic, assign) long               nsObjectTestCategory_long;
@property (nonatomic, assign) unsigned long      nsObjectTestCategory_unsigned_long;
@property (nonatomic, assign) long long          nsObjectTestCategory_long_long;
@property (nonatomic, assign) unsigned long long nsObjectTestCategory_unsigned_long_long;
@property (nonatomic, assign) int                nsObjectTestCategory_int;
@property (nonatomic, assign) unsigned int       nsObjectTestCategory_unsigned_int;
@property (nonatomic, assign) float              nsObjectTestCategory_float;
@property (nonatomic, assign) double             nsObjectTestCategory_double;
@property (nonatomic, assign) BOOL               nsObjectTestCategory_BOOL;

@property (nonatomic, assign) NSInteger          nsObjectTestCategory_NSInteger;
@property (nonatomic, assign) NSUInteger         nsObjectTestCategory_NSUInteger;

@property (nonatomic, assign) CGPoint            nsObjectTestCategory_CGPoint;
@property (nonatomic, assign) CGVector           nsObjectTestCategory_CGVector;
@property (nonatomic, assign) CGSize             nsObjectTestCategory_CGSize;
@property (nonatomic, assign) CGRect             nsObjectTestCategory_CGRect;
@property (nonatomic, assign) CGAffineTransform  nsObjectTestCategory_CGAffineTransform;
@property (nonatomic, assign) UIEdgeInsets       nsObjectTestCategory_UIEdgeInsets;
@property (nonatomic, assign) UIOffset           nsObjectTestCategory_UIOffset;

@property (nonatomic, assign) CATransform3D      nsObjectTestCategory_CATransofrm3D;

@end
