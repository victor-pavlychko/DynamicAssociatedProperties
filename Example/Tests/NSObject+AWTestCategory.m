//
//  NSObject+AWTestCategory.m
//  DynamicAssociatedProperties
//
//  Created by Victor Pavlychko on 03.10.2015.
//  Copyright © 2015 Victor Pavlychko. All rights reserved.
//

#import "NSObject+AWTestCategory.h"

@implementation NSObject (AWTestCategory)

@dynamic nsObjectTestCategoryStrongNonatomic;
@dynamic nsObjectTestCategoryStrongAtomic;
@dynamic nsObjectTestCategoryCopyNonatomic;
@dynamic nsObjectTestCategoryCopyAtomic;
@dynamic nsObjectTestCategoryWeakNonatomic;
@dynamic nsObjectTestCategoryWeakAtomic;
@dynamic nsObjectTestCategoryAssignNonatomic;
@dynamic nsObjectTestCategoryAssignAtomic;

@dynamic nsObjectTestCategoryValueNonatomic;
@dynamic nsObjectTestCategoryValueAtomic;

@dynamic nsObjectTestCategoryCustomGetter;
@dynamic nsObjectTestCategoryCustomSetter;
@dynamic nsObjectTestCategoryCustomAccessors;

@dynamic nsObjectTestCategory_char;
@dynamic nsObjectTestCategory_unsigned_char;
@dynamic nsObjectTestCategory_short;
@dynamic nsObjectTestCategory_unsigned_short;
@dynamic nsObjectTestCategory_long;
@dynamic nsObjectTestCategory_unsigned_long;
@dynamic nsObjectTestCategory_long_long;
@dynamic nsObjectTestCategory_unsigned_long_long;
@dynamic nsObjectTestCategory_int;
@dynamic nsObjectTestCategory_unsigned_int;
@dynamic nsObjectTestCategory_float;
@dynamic nsObjectTestCategory_double;
@dynamic nsObjectTestCategory_BOOL;

@dynamic nsObjectTestCategory_NSInteger;
@dynamic nsObjectTestCategory_NSUInteger;

@dynamic nsObjectTestCategory_CGPoint;
@dynamic nsObjectTestCategory_CGVector;
@dynamic nsObjectTestCategory_CGSize;
@dynamic nsObjectTestCategory_CGRect;
@dynamic nsObjectTestCategory_CGAffineTransform;
@dynamic nsObjectTestCategory_UIEdgeInsets;
@dynamic nsObjectTestCategory_UIOffset;

@dynamic nsObjectTestCategory_CATransofrm3D;

+ (void)load
{
    [self dynamicAssociatedPropertiesRegisterAll];
}

@end
