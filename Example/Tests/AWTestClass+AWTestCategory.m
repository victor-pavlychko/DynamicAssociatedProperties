//
//  AWTestClass+AWTestCategory.m
//  DynamicAssociatedProperties
//
//  Created by Victor Pavlychko on 03.10.2015.
//  Copyright © 2015 Victor Pavlychko. All rights reserved.
//

#import "AWTestClass+AWTestCategory.h"

@implementation AWTestClass (AWTestCategory)

@dynamic awTestClassCategoryStrongNonatomic;
@dynamic awTestClassCategoryStrongAtomic;
@dynamic awTestClassCategoryCopyNonatomic;
@dynamic awTestClassCategoryCopyAtomic;
@dynamic awTestClassCategoryWeakNonatomic;
@dynamic awTestClassCategoryWeakAtomic;
@dynamic awTestClassCategoryAssignNonatomic;
@dynamic awTestClassCategoryAssignAtomic;

@dynamic awTestClassCategoryValueNonatomic;
@dynamic awTestClassCategoryValueAtomic;

@dynamic awTestClassCategoryCustomGetter;
@dynamic awTestClassCategoryCustomSetter;
@dynamic awTestClassCategoryCustomAccessors;

@dynamic awTestClassCategory_char;
@dynamic awTestClassCategory_unsigned_char;
@dynamic awTestClassCategory_short;
@dynamic awTestClassCategory_unsigned_short;
@dynamic awTestClassCategory_long;
@dynamic awTestClassCategory_unsigned_long;
@dynamic awTestClassCategory_long_long;
@dynamic awTestClassCategory_unsigned_long_long;
@dynamic awTestClassCategory_int;
@dynamic awTestClassCategory_unsigned_int;
@dynamic awTestClassCategory_float;
@dynamic awTestClassCategory_double;
@dynamic awTestClassCategory_BOOL;

@dynamic awTestClassCategory_NSInteger;
@dynamic awTestClassCategory_NSUInteger;

@dynamic awTestClassCategory_CGPoint;
@dynamic awTestClassCategory_CGVector;
@dynamic awTestClassCategory_CGSize;
@dynamic awTestClassCategory_CGRect;
@dynamic awTestClassCategory_CGAffineTransform;
@dynamic awTestClassCategory_UIEdgeInsets;
@dynamic awTestClassCategory_UIOffset;

@dynamic awTestClassCategory_CATransofrm3D;

+ (void)load
{
    [self dynamicAssociatedPropertiesRegisterAll];
}

@end
