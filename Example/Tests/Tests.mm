//
//  DynamicAssociatedPropertiesTests.m
//  DynamicAssociatedPropertiesTests
//
//  Created by Victor Pavlychko on 10/03/2015.
//  Copyright (c) 2015 Victor Pavlychko. All rights reserved.
//

// https://github.com/Specta/Specta

#import "AWTestClass.h"
#import "AWTestClass+AWTestCategory.h"
#import "NSObject+AWTestCategory.h"

#define VALUE_TEST_CASE(class__, property__, value__) \
    it(@#property__, ^{ \
        class__ *obj = [[class__ alloc] init]; \
        obj.property__ = value__; \
        expect(obj.property__).to.equal(value__); \
    })

#define STRONG_TEST_CASE(class__, property__) \
    it(@#property__, ^{ \
        NSMutableString *value = [@"str" mutableCopy]; \
        class__ *obj = [[class__ alloc] init]; \
        obj.property__ = value; \
        expect(obj.property__).to.beIdenticalTo(value); \
    })

#define COPY_TEST_CASE(class__, property__) \
    it(@#property__, ^{ \
        NSMutableString *value = [@"str" mutableCopy]; \
        class__ *obj = [[class__ alloc] init]; \
        obj.property__ = value; \
        expect(obj.property__).notTo.beIdenticalTo(value); \
        expect(obj.property__).to.equal(value); \
    })

#define WEAK_TEST_CASE(class__, property__) \
    it(@#property__, ^{ \
        class__ *obj = [[class__ alloc] init]; \
        __weak NSMutableString *weakValue = nil; \
        @autoreleasepool { \
            NSMutableString *value = [@"str" mutableCopy]; \
            weakValue = value; \
            obj.property__ = value; \
            expect(obj.property__).to.beIdenticalTo(value); \
            value = nil; \
        } \
        expect(weakValue).to.beNil(); \
        expect(obj.property__).to.beNil(); \
    })

#define ASSIGN_TEST_CASE(class__, property__) \
    it(@#property__, ^{ \
        class__ *obj = [[class__ alloc] init]; \
        __weak NSMutableString *weakValue = nil; \
        @autoreleasepool { \
            NSMutableString *value = [@"str" mutableCopy]; \
            weakValue = value; \
            obj.property__ = value; \
            expect(obj.property__).to.beIdenticalTo(value); \
            value = nil; \
        } \
        expect(weakValue).to.beNil(); \
    })


SpecBegin(InitialSpecs)

describe(@"NSObject Category", ^{
    
    STRONG_TEST_CASE(NSObject, nsObjectTestCategoryStrongNonatomic);
    STRONG_TEST_CASE(NSObject, nsObjectTestCategoryStrongAtomic);
    COPY_TEST_CASE(NSObject, nsObjectTestCategoryCopyNonatomic);
    COPY_TEST_CASE(NSObject, nsObjectTestCategoryCopyAtomic);
    WEAK_TEST_CASE(NSObject, nsObjectTestCategoryWeakNonatomic);
    WEAK_TEST_CASE(NSObject, nsObjectTestCategoryWeakAtomic);
    ASSIGN_TEST_CASE(NSObject, nsObjectTestCategoryAssignNonatomic);
    ASSIGN_TEST_CASE(NSObject, nsObjectTestCategoryAssignAtomic);
    
    VALUE_TEST_CASE(NSObject, nsObjectTestCategoryValueNonatomic, __LINE__);
    VALUE_TEST_CASE(NSObject, nsObjectTestCategoryValueAtomic, __LINE__);
    
    STRONG_TEST_CASE(NSObject, nsObjectTestCategoryCustomGetter);
    STRONG_TEST_CASE(NSObject, nsObjectTestCategoryCustomSetter);
    STRONG_TEST_CASE(NSObject, nsObjectTestCategoryCustomAccessors);
    
    VALUE_TEST_CASE(NSObject, nsObjectTestCategory_char, __LINE__ & 0x7f);
    VALUE_TEST_CASE(NSObject, nsObjectTestCategory_unsigned_char, __LINE__ & 0x7f);
    VALUE_TEST_CASE(NSObject, nsObjectTestCategory_short, __LINE__);
    VALUE_TEST_CASE(NSObject, nsObjectTestCategory_unsigned_short, __LINE__);
    VALUE_TEST_CASE(NSObject, nsObjectTestCategory_long, __LINE__);
    VALUE_TEST_CASE(NSObject, nsObjectTestCategory_unsigned_long, __LINE__);
    VALUE_TEST_CASE(NSObject, nsObjectTestCategory_long_long, __LINE__);
    VALUE_TEST_CASE(NSObject, nsObjectTestCategory_unsigned_long_long, __LINE__);
    VALUE_TEST_CASE(NSObject, nsObjectTestCategory_int, __LINE__);
    VALUE_TEST_CASE(NSObject, nsObjectTestCategory_unsigned_int, __LINE__);
    VALUE_TEST_CASE(NSObject, nsObjectTestCategory_float, __LINE__ * 0.3f);
    VALUE_TEST_CASE(NSObject, nsObjectTestCategory_double, __LINE__ * 0.5);
    VALUE_TEST_CASE(NSObject, nsObjectTestCategory_BOOL, YES);
    VALUE_TEST_CASE(NSObject, nsObjectTestCategory_BOOL, NO);
    
    VALUE_TEST_CASE(NSObject, nsObjectTestCategory_NSInteger, __LINE__);
    VALUE_TEST_CASE(NSObject, nsObjectTestCategory_NSUInteger, __LINE__);
    
    VALUE_TEST_CASE(NSObject, nsObjectTestCategory_CGPoint, CGPointMake(__LINE__, __LINE__));
    VALUE_TEST_CASE(NSObject, nsObjectTestCategory_CGVector, CGVectorMake(__LINE__, __LINE__));
    VALUE_TEST_CASE(NSObject, nsObjectTestCategory_CGSize, CGSizeMake(__LINE__, __LINE__) );
    VALUE_TEST_CASE(NSObject, nsObjectTestCategory_CGRect, CGRectMake(__LINE__, __LINE__, __LINE__, __LINE__));
    VALUE_TEST_CASE(NSObject, nsObjectTestCategory_UIEdgeInsets, UIEdgeInsetsMake(__LINE__, __LINE__, __LINE__, __LINE__));
    VALUE_TEST_CASE(NSObject, nsObjectTestCategory_UIOffset, UIOffsetMake(__LINE__, __LINE__));

});

describe(@"Custom Class NSObject Category", ^{

    STRONG_TEST_CASE(AWTestClass, nsObjectTestCategoryStrongNonatomic);
    STRONG_TEST_CASE(AWTestClass, nsObjectTestCategoryStrongAtomic);
    COPY_TEST_CASE(AWTestClass, nsObjectTestCategoryCopyNonatomic);
    COPY_TEST_CASE(AWTestClass, nsObjectTestCategoryCopyAtomic);
    WEAK_TEST_CASE(AWTestClass, nsObjectTestCategoryWeakNonatomic);
    WEAK_TEST_CASE(AWTestClass, nsObjectTestCategoryWeakAtomic);
    ASSIGN_TEST_CASE(AWTestClass, nsObjectTestCategoryAssignNonatomic);
    ASSIGN_TEST_CASE(AWTestClass, nsObjectTestCategoryAssignAtomic);
    
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategoryValueNonatomic, __LINE__);
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategoryValueAtomic, __LINE__);
    
    STRONG_TEST_CASE(AWTestClass, nsObjectTestCategoryCustomGetter);
    STRONG_TEST_CASE(AWTestClass, nsObjectTestCategoryCustomSetter);
    STRONG_TEST_CASE(AWTestClass, nsObjectTestCategoryCustomAccessors);
    
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategory_char, __LINE__ & 0x7f);
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategory_unsigned_char, __LINE__ & 0x7f);
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategory_short, __LINE__);
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategory_unsigned_short, __LINE__);
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategory_long, __LINE__);
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategory_unsigned_long, __LINE__);
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategory_long_long, __LINE__);
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategory_unsigned_long_long, __LINE__);
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategory_int, __LINE__);
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategory_unsigned_int, __LINE__);
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategory_float, __LINE__ * 0.3f);
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategory_double, __LINE__ * 0.5);
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategory_BOOL, YES);
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategory_BOOL, NO);
    
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategory_NSInteger, __LINE__);
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategory_NSUInteger, __LINE__);
    
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategory_CGPoint, CGPointMake(__LINE__, __LINE__));
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategory_CGVector, CGVectorMake(__LINE__, __LINE__));
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategory_CGSize, CGSizeMake(__LINE__, __LINE__) );
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategory_CGRect, CGRectMake(__LINE__, __LINE__, __LINE__, __LINE__));
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategory_UIEdgeInsets, UIEdgeInsetsMake(__LINE__, __LINE__, __LINE__, __LINE__));
    VALUE_TEST_CASE(AWTestClass, nsObjectTestCategory_UIOffset, UIOffsetMake(__LINE__, __LINE__));

});

describe(@"Custom Class", ^{
    
    STRONG_TEST_CASE(AWTestClass, awTestClassStrongNonatomic);
    STRONG_TEST_CASE(AWTestClass, awTestClassStrongAtomic);
    COPY_TEST_CASE(AWTestClass, awTestClassCopyNonatomic);
    COPY_TEST_CASE(AWTestClass, awTestClassCopyAtomic);
    WEAK_TEST_CASE(AWTestClass, awTestClassWeakNonatomic);
    WEAK_TEST_CASE(AWTestClass, awTestClassWeakAtomic);
    ASSIGN_TEST_CASE(AWTestClass, awTestClassAssignNonatomic);
    ASSIGN_TEST_CASE(AWTestClass, awTestClassAssignAtomic);
    
    VALUE_TEST_CASE(AWTestClass, awTestClassValueNonatomic, __LINE__);
    VALUE_TEST_CASE(AWTestClass, awTestClassValueAtomic, __LINE__);
    
    STRONG_TEST_CASE(AWTestClass, awTestClassCustomGetter);
    STRONG_TEST_CASE(AWTestClass, awTestClassCustomSetter);
    STRONG_TEST_CASE(AWTestClass, awTestClassCustomAccessors);
    
    VALUE_TEST_CASE(AWTestClass, awTestClass_char, __LINE__ & 0x7f);
    VALUE_TEST_CASE(AWTestClass, awTestClass_unsigned_char, __LINE__ & 0x7f);
    VALUE_TEST_CASE(AWTestClass, awTestClass_short, __LINE__);
    VALUE_TEST_CASE(AWTestClass, awTestClass_unsigned_short, __LINE__);
    VALUE_TEST_CASE(AWTestClass, awTestClass_long, __LINE__);
    VALUE_TEST_CASE(AWTestClass, awTestClass_unsigned_long, __LINE__);
    VALUE_TEST_CASE(AWTestClass, awTestClass_long_long, __LINE__);
    VALUE_TEST_CASE(AWTestClass, awTestClass_unsigned_long_long, __LINE__);
    VALUE_TEST_CASE(AWTestClass, awTestClass_int, __LINE__);
    VALUE_TEST_CASE(AWTestClass, awTestClass_unsigned_int, __LINE__);
    VALUE_TEST_CASE(AWTestClass, awTestClass_float, __LINE__ * 0.3f);
    VALUE_TEST_CASE(AWTestClass, awTestClass_double, __LINE__ * 0.5);
    VALUE_TEST_CASE(AWTestClass, awTestClass_BOOL, YES);
    VALUE_TEST_CASE(AWTestClass, awTestClass_BOOL, NO);
    
    VALUE_TEST_CASE(AWTestClass, awTestClass_NSInteger, __LINE__);
    VALUE_TEST_CASE(AWTestClass, awTestClass_NSUInteger, __LINE__);

    VALUE_TEST_CASE(AWTestClass, awTestClass_CGPoint, CGPointMake(__LINE__, __LINE__));
    VALUE_TEST_CASE(AWTestClass, awTestClass_CGVector, CGVectorMake(__LINE__, __LINE__));
    VALUE_TEST_CASE(AWTestClass, awTestClass_CGSize, CGSizeMake(__LINE__, __LINE__) );
    VALUE_TEST_CASE(AWTestClass, awTestClass_CGRect, CGRectMake(__LINE__, __LINE__, __LINE__, __LINE__));
    VALUE_TEST_CASE(AWTestClass, awTestClass_UIEdgeInsets, UIEdgeInsetsMake(__LINE__, __LINE__, __LINE__, __LINE__));
    VALUE_TEST_CASE(AWTestClass, awTestClass_UIOffset, UIOffsetMake(__LINE__, __LINE__));
    
});

describe(@"Custom Class Category", ^{

    STRONG_TEST_CASE(AWTestClass, awTestClassCategoryStrongNonatomic);
    STRONG_TEST_CASE(AWTestClass, awTestClassCategoryStrongAtomic);
    COPY_TEST_CASE(AWTestClass, awTestClassCategoryCopyNonatomic);
    COPY_TEST_CASE(AWTestClass, awTestClassCategoryCopyAtomic);
    WEAK_TEST_CASE(AWTestClass, awTestClassCategoryWeakNonatomic);
    WEAK_TEST_CASE(AWTestClass, awTestClassCategoryWeakAtomic);
    ASSIGN_TEST_CASE(AWTestClass, awTestClassCategoryAssignNonatomic);
    ASSIGN_TEST_CASE(AWTestClass, awTestClassCategoryAssignAtomic);
    
    VALUE_TEST_CASE(AWTestClass, awTestClassCategoryValueNonatomic, __LINE__);
    VALUE_TEST_CASE(AWTestClass, awTestClassCategoryValueAtomic, __LINE__);
    
    STRONG_TEST_CASE(AWTestClass, awTestClassCategoryCustomGetter);
    STRONG_TEST_CASE(AWTestClass, awTestClassCategoryCustomSetter);
    STRONG_TEST_CASE(AWTestClass, awTestClassCategoryCustomAccessors);
    
    VALUE_TEST_CASE(AWTestClass, awTestClassCategory_char, __LINE__ & 0x7f);
    VALUE_TEST_CASE(AWTestClass, awTestClassCategory_unsigned_char, __LINE__ & 0x7f);
    VALUE_TEST_CASE(AWTestClass, awTestClassCategory_short, __LINE__);
    VALUE_TEST_CASE(AWTestClass, awTestClassCategory_unsigned_short, __LINE__);
    VALUE_TEST_CASE(AWTestClass, awTestClassCategory_long, __LINE__);
    VALUE_TEST_CASE(AWTestClass, awTestClassCategory_unsigned_long, __LINE__);
    VALUE_TEST_CASE(AWTestClass, awTestClassCategory_long_long, __LINE__);
    VALUE_TEST_CASE(AWTestClass, awTestClassCategory_unsigned_long_long, __LINE__);
    VALUE_TEST_CASE(AWTestClass, awTestClassCategory_int, __LINE__);
    VALUE_TEST_CASE(AWTestClass, awTestClassCategory_unsigned_int, __LINE__);
    VALUE_TEST_CASE(AWTestClass, awTestClassCategory_float, __LINE__ * 0.3f);
    VALUE_TEST_CASE(AWTestClass, awTestClassCategory_double, __LINE__ * 0.5);
    VALUE_TEST_CASE(AWTestClass, awTestClassCategory_BOOL, YES);
    VALUE_TEST_CASE(AWTestClass, awTestClassCategory_BOOL, NO);
    
    VALUE_TEST_CASE(AWTestClass, awTestClassCategory_NSInteger, __LINE__);
    VALUE_TEST_CASE(AWTestClass, awTestClassCategory_NSUInteger, __LINE__);
    
    VALUE_TEST_CASE(AWTestClass, awTestClassCategory_CGPoint, CGPointMake(__LINE__, __LINE__));
    VALUE_TEST_CASE(AWTestClass, awTestClassCategory_CGVector, CGVectorMake(__LINE__, __LINE__));
    VALUE_TEST_CASE(AWTestClass, awTestClassCategory_CGSize, CGSizeMake(__LINE__, __LINE__) );
    VALUE_TEST_CASE(AWTestClass, awTestClassCategory_CGRect, CGRectMake(__LINE__, __LINE__, __LINE__, __LINE__));
    VALUE_TEST_CASE(AWTestClass, awTestClassCategory_UIEdgeInsets, UIEdgeInsetsMake(__LINE__, __LINE__, __LINE__, __LINE__));
    VALUE_TEST_CASE(AWTestClass, awTestClassCategory_UIOffset, UIOffsetMake(__LINE__, __LINE__));

});

SpecEnd

