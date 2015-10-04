//
//  AccessorBlockFactories.hpp
//  Experiments
//
//  Created by Victor Pavlychko on 03.10.2015.
//  Copyright © 2015 Address WTF. All rights reserved.
//

#ifndef AccessorBlockFactories_h
#define AccessorBlockFactories_h

#import <objc/runtime.h>
#import "DynamicAssociatedPropertyWeakHolder.h"

namespace address_wtf {
namespace objc_dynamic_associated_properties {
namespace accessor_block_factories {

    template<typename T>
    id getterBlockFactory(const void *key)
    {
        return ^(id self_)
        {
            T result;
            [objc_getAssociatedObject(self_, key) getValue:&result];
            return result;
        };
    }
    
    template<> id getterBlockFactory<id>                 (const void *key) { return ^(id self_) { return objc_getAssociatedObject(self_, key); }; }
    template<> id getterBlockFactory<char>               (const void *key) { return ^(id self_) { return [objc_getAssociatedObject(self_, key) charValue]; }; }
    template<> id getterBlockFactory<unsigned char>      (const void *key) { return ^(id self_) { return [objc_getAssociatedObject(self_, key) unsignedCharValue]; }; }
    template<> id getterBlockFactory<short>              (const void *key) { return ^(id self_) { return [objc_getAssociatedObject(self_, key) shortValue]; }; }
    template<> id getterBlockFactory<unsigned short>     (const void *key) { return ^(id self_) { return [objc_getAssociatedObject(self_, key) unsignedShortValue]; }; }
    template<> id getterBlockFactory<int>                (const void *key) { return ^(id self_) { return [objc_getAssociatedObject(self_, key) intValue]; }; }
    template<> id getterBlockFactory<unsigned int>       (const void *key) { return ^(id self_) { return [objc_getAssociatedObject(self_, key) unsignedIntValue]; }; }
    template<> id getterBlockFactory<long>               (const void *key) { return ^(id self_) { return [objc_getAssociatedObject(self_, key) longValue]; }; }
    template<> id getterBlockFactory<unsigned long>      (const void *key) { return ^(id self_) { return [objc_getAssociatedObject(self_, key) unsignedLongValue]; }; }
    template<> id getterBlockFactory<long long>          (const void *key) { return ^(id self_) { return [objc_getAssociatedObject(self_, key) longLongValue]; }; }
    template<> id getterBlockFactory<unsigned long long> (const void *key) { return ^(id self_) { return [objc_getAssociatedObject(self_, key) unsignedLongLongValue]; }; }
    template<> id getterBlockFactory<float>              (const void *key) { return ^(id self_) { return [objc_getAssociatedObject(self_, key) floatValue]; }; }
    template<> id getterBlockFactory<double>             (const void *key) { return ^(id self_) { return [objc_getAssociatedObject(self_, key) doubleValue]; }; }
    template<> id getterBlockFactory<BOOL>               (const void *key) { return ^(id self_) { return [objc_getAssociatedObject(self_, key) boolValue]; }; }
    
    id getterWeakBlockFactory(const void *key)
    {
        return ^(id self_)
        {
            return [(DynamicAssociatedPropertyWeakHolder *)objc_getAssociatedObject(self_, key) value];
        };
    }
    
    template<typename T>
    id setterBlockFactory(const void *key, objc_AssociationPolicy policy)
    {
        return ^(id self_, T value_)
        {
            objc_setAssociatedObject(self_, key, [NSValue valueWithBytes:&value_ objCType:@encode(T)], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        };
    }
    
    template<> id setterBlockFactory<id>                 (const void *key, objc_AssociationPolicy policy) { return ^(id self_, id value_)                 { objc_setAssociatedObject(self_, key, value_, policy); }; }
    template<> id setterBlockFactory<char>               (const void *key, objc_AssociationPolicy policy) { return ^(id self_, char value_)               { objc_setAssociatedObject(self_, key, [NSNumber numberWithChar:value_],             OBJC_ASSOCIATION_RETAIN_NONATOMIC); }; }
    template<> id setterBlockFactory<unsigned char>      (const void *key, objc_AssociationPolicy policy) { return ^(id self_, unsigned char value_)      { objc_setAssociatedObject(self_, key, [NSNumber numberWithUnsignedChar:value_],     OBJC_ASSOCIATION_RETAIN_NONATOMIC); }; }
    template<> id setterBlockFactory<short>              (const void *key, objc_AssociationPolicy policy) { return ^(id self_, short value_)              { objc_setAssociatedObject(self_, key, [NSNumber numberWithShort:value_],            OBJC_ASSOCIATION_RETAIN_NONATOMIC); }; }
    template<> id setterBlockFactory<unsigned short>     (const void *key, objc_AssociationPolicy policy) { return ^(id self_, unsigned short value_)     { objc_setAssociatedObject(self_, key, [NSNumber numberWithUnsignedShort:value_],    OBJC_ASSOCIATION_RETAIN_NONATOMIC); }; }
    template<> id setterBlockFactory<int>                (const void *key, objc_AssociationPolicy policy) { return ^(id self_, int value_)                { objc_setAssociatedObject(self_, key, [NSNumber numberWithInt:value_],              OBJC_ASSOCIATION_RETAIN_NONATOMIC); }; }
    template<> id setterBlockFactory<unsigned int>       (const void *key, objc_AssociationPolicy policy) { return ^(id self_, unsigned int value_)       { objc_setAssociatedObject(self_, key, [NSNumber numberWithUnsignedInt:value_],      OBJC_ASSOCIATION_RETAIN_NONATOMIC); }; }
    template<> id setterBlockFactory<long>               (const void *key, objc_AssociationPolicy policy) { return ^(id self_, long value_)               { objc_setAssociatedObject(self_, key, [NSNumber numberWithLong:value_],             OBJC_ASSOCIATION_RETAIN_NONATOMIC); }; }
    template<> id setterBlockFactory<unsigned long>      (const void *key, objc_AssociationPolicy policy) { return ^(id self_, unsigned long value_)      { objc_setAssociatedObject(self_, key, [NSNumber numberWithUnsignedLong:value_],     OBJC_ASSOCIATION_RETAIN_NONATOMIC); }; }
    template<> id setterBlockFactory<long long>          (const void *key, objc_AssociationPolicy policy) { return ^(id self_, long long value_)          { objc_setAssociatedObject(self_, key, [NSNumber numberWithLongLong:value_],         OBJC_ASSOCIATION_RETAIN_NONATOMIC); }; }
    template<> id setterBlockFactory<unsigned long long> (const void *key, objc_AssociationPolicy policy) { return ^(id self_, unsigned long long value_) { objc_setAssociatedObject(self_, key, [NSNumber numberWithUnsignedLongLong:value_], OBJC_ASSOCIATION_RETAIN_NONATOMIC); }; }
    template<> id setterBlockFactory<float>              (const void *key, objc_AssociationPolicy policy) { return ^(id self_, float value_)              { objc_setAssociatedObject(self_, key, [NSNumber numberWithFloat:value_],            OBJC_ASSOCIATION_RETAIN_NONATOMIC); }; }
    template<> id setterBlockFactory<double>             (const void *key, objc_AssociationPolicy policy) { return ^(id self_, double value_)             { objc_setAssociatedObject(self_, key, [NSNumber numberWithDouble:value_],           OBJC_ASSOCIATION_RETAIN_NONATOMIC); }; }
    template<> id setterBlockFactory<BOOL>               (const void *key, objc_AssociationPolicy policy) { return ^(id self_, BOOL value_)               { objc_setAssociatedObject(self_, key, [NSNumber numberWithBool:value_],             OBJC_ASSOCIATION_RETAIN_NONATOMIC); }; }
    
    id setterWeakBlockFactory(const void *key, objc_AssociationPolicy policy)
    {
        return ^(id self_, id value_)
        {
            objc_setAssociatedObject(self_, key, [DynamicAssociatedPropertyWeakHolder holderWithValue:value_], policy);
        };
    }

}}}

#endif /* AccessorBlockFactories_h */
