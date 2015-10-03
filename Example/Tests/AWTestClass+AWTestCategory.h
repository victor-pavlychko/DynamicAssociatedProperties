//
//  AWTestClass+AWTestCategory.h
//  DynamicAssociatedProperties
//
//  Created by Victor Pavlychko on 03.10.2015.
//  Copyright © 2015 Victor Pavlychko. All rights reserved.
//

#import "AWTestClass.h"

@interface AWTestClass (AWTestCategory)

@property (nonatomic, strong) NSMutableString *awTestClassCategoryStrongNonatomic;
@property (atomic,    strong) NSMutableString *awTestClassCategoryStrongAtomic;
@property (nonatomic, copy)   NSMutableString *awTestClassCategoryCopyNonatomic;
@property (atomic,    copy)   NSMutableString *awTestClassCategoryCopyAtomic;
@property (nonatomic, weak)   NSMutableString *awTestClassCategoryWeakNonatomic;
@property (atomic,    weak)   NSMutableString *awTestClassCategoryWeakAtomic;
@property (nonatomic, assign) NSMutableString *awTestClassCategoryAssignNonatomic;
@property (atomic,    assign) NSMutableString *awTestClassCategoryAssignAtomic;

@property (nonatomic, assign) NSInteger awTestClassCategoryValueNonatomic;
@property (atomic,    assign) NSInteger awTestClassCategoryValueAtomic;

@property (nonatomic, strong, getter=awTestClassCategoryCustomGetter_get) NSMutableString *awTestClassCategoryCustomGetter;
@property (nonatomic, strong, setter=awTestClassCategoryCustomSetter_set:) NSMutableString *awTestClassCategoryCustomSetter;
@property (nonatomic, strong, getter=awTestClassCategoryCustomAccessors_get, setter=awTestClassCategoryCustomAccessors_set:) NSMutableString *awTestClassCategoryCustomAccessors;

@property (nonatomic, assign) char               awTestClassCategory_char;
@property (nonatomic, assign) unsigned char      awTestClassCategory_unsigned_char;
@property (nonatomic, assign) short              awTestClassCategory_short;
@property (nonatomic, assign) unsigned short     awTestClassCategory_unsigned_short;
@property (nonatomic, assign) long               awTestClassCategory_long;
@property (nonatomic, assign) unsigned long      awTestClassCategory_unsigned_long;
@property (nonatomic, assign) long long          awTestClassCategory_long_long;
@property (nonatomic, assign) unsigned long long awTestClassCategory_unsigned_long_long;
@property (nonatomic, assign) int                awTestClassCategory_int;
@property (nonatomic, assign) unsigned int       awTestClassCategory_unsigned_int;
@property (nonatomic, assign) float              awTestClassCategory_float;
@property (nonatomic, assign) double             awTestClassCategory_double;
@property (nonatomic, assign) BOOL               awTestClassCategory_BOOL;

@property (nonatomic, assign) NSInteger          awTestClassCategory_NSInteger;
@property (nonatomic, assign) NSUInteger         awTestClassCategory_NSUInteger;

@property (nonatomic, assign) CGPoint            awTestClassCategory_CGPoint;
@property (nonatomic, assign) CGVector           awTestClassCategory_CGVector;
@property (nonatomic, assign) CGSize             awTestClassCategory_CGSize;
@property (nonatomic, assign) CGRect             awTestClassCategory_CGRect;
@property (nonatomic, assign) CGAffineTransform  awTestClassCategory_CGAffineTransform;
@property (nonatomic, assign) UIEdgeInsets       awTestClassCategory_UIEdgeInsets;
@property (nonatomic, assign) UIOffset           awTestClassCategory_UIOffset;

@property (nonatomic, assign) CATransform3D      awTestClassCategory_CATransofrm3D;

@end
