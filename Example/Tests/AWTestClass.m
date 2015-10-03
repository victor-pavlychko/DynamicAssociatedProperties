//
//  AWTestClass.m
//  DynamicAssociatedProperties
//
//  Created by Victor Pavlychko on 03.10.2015.
//  Copyright © 2015 Victor Pavlychko. All rights reserved.
//

#import "AWTestClass.h"

@implementation AWTestClass

@dynamic awTestClassStrongNonatomic;
@dynamic awTestClassStrongAtomic;
@dynamic awTestClassCopyNonatomic;
@dynamic awTestClassCopyAtomic;
@dynamic awTestClassWeakNonatomic;
@dynamic awTestClassWeakAtomic;
@dynamic awTestClassAssignNonatomic;
@dynamic awTestClassAssignAtomic;

@dynamic awTestClassValueNonatomic;
@dynamic awTestClassValueAtomic;

@dynamic awTestClassCustomGetter;
@dynamic awTestClassCustomSetter;
@dynamic awTestClassCustomAccessors;

@dynamic awTestClass_char;
@dynamic awTestClass_unsigned_char;
@dynamic awTestClass_short;
@dynamic awTestClass_unsigned_short;
@dynamic awTestClass_long;
@dynamic awTestClass_unsigned_long;
@dynamic awTestClass_long_long;
@dynamic awTestClass_unsigned_long_long;
@dynamic awTestClass_int;
@dynamic awTestClass_unsigned_int;
@dynamic awTestClass_float;
@dynamic awTestClass_double;
@dynamic awTestClass_BOOL;

@dynamic awTestClass_NSInteger;
@dynamic awTestClass_NSUInteger;

@dynamic awTestClass_CGPoint;
@dynamic awTestClass_CGVector;
@dynamic awTestClass_CGSize;
@dynamic awTestClass_CGRect;
@dynamic awTestClass_CGAffineTransform;
@dynamic awTestClass_UIEdgeInsets;
@dynamic awTestClass_UIOffset;

@dynamic awTestClass_CATransofrm3D;

+ (void)load
{
    [self dynamicAssociatedPropertiesRegisterAll];
}

@end
