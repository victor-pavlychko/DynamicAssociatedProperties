//
//  AWTestClass.h
//  DynamicAssociatedProperties
//
//  Created by Victor Pavlychko on 03.10.2015.
//  Copyright © 2015 Victor Pavlychko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AWTestClass : NSObject

@property (nonatomic, strong) NSMutableString *awTestClassStrongNonatomic;
@property (atomic,    strong) NSMutableString *awTestClassStrongAtomic;
@property (nonatomic, copy)   NSMutableString *awTestClassCopyNonatomic;
@property (atomic,    copy)   NSMutableString *awTestClassCopyAtomic;
@property (nonatomic, weak)   NSMutableString *awTestClassWeakNonatomic;
@property (atomic,    weak)   NSMutableString *awTestClassWeakAtomic;
@property (nonatomic, assign) NSMutableString *awTestClassAssignNonatomic;
@property (atomic,    assign) NSMutableString *awTestClassAssignAtomic;

@property (nonatomic, assign) NSInteger awTestClassValueNonatomic;
@property (atomic,    assign) NSInteger awTestClassValueAtomic;

@property (nonatomic, strong, getter=awTestClassCustomGetter_get) NSMutableString *awTestClassCustomGetter;
@property (nonatomic, strong, setter=awTestClassCustomSetter_set:) NSMutableString *awTestClassCustomSetter;
@property (nonatomic, strong, getter=awTestClassCustomAccessors_get, setter=awTestClassCustomAccessors_set:) NSMutableString *awTestClassCustomAccessors;

@property (nonatomic, assign) char               awTestClass_char;
@property (nonatomic, assign) unsigned char      awTestClass_unsigned_char;
@property (nonatomic, assign) short              awTestClass_short;
@property (nonatomic, assign) unsigned short     awTestClass_unsigned_short;
@property (nonatomic, assign) long               awTestClass_long;
@property (nonatomic, assign) unsigned long      awTestClass_unsigned_long;
@property (nonatomic, assign) long long          awTestClass_long_long;
@property (nonatomic, assign) unsigned long long awTestClass_unsigned_long_long;
@property (nonatomic, assign) int                awTestClass_int;
@property (nonatomic, assign) unsigned int       awTestClass_unsigned_int;
@property (nonatomic, assign) float              awTestClass_float;
@property (nonatomic, assign) double             awTestClass_double;
@property (nonatomic, assign) BOOL               awTestClass_BOOL;

@property (nonatomic, assign) NSInteger          awTestClass_NSInteger;
@property (nonatomic, assign) NSUInteger         awTestClass_NSUInteger;

@property (nonatomic, assign) CGPoint            awTestClass_CGPoint;
@property (nonatomic, assign) CGVector           awTestClass_CGVector;
@property (nonatomic, assign) CGSize             awTestClass_CGSize;
@property (nonatomic, assign) CGRect             awTestClass_CGRect;
@property (nonatomic, assign) CGAffineTransform  awTestClass_CGAffineTransform;
@property (nonatomic, assign) UIEdgeInsets       awTestClass_UIEdgeInsets;
@property (nonatomic, assign) UIOffset           awTestClass_UIOffset;

@property (nonatomic, assign) CATransform3D      awTestClass_CATransofrm3D;

@end
