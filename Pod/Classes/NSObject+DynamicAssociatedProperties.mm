//
//  NSObject+DynamicAssociatedProperties.m
//  Experiments
//
//  Created by Victor Pavlychko on 03.10.2015.
//  Copyright © 2015 Address WTF. All rights reserved.
//

#import "NSObject+DynamicAssociatedProperties.h"

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#include <string>
#include <map>

#include "ObjcRuntimeXX.h"
#include "AccessorBlockFactoryRegistry.h"

namespace
{
    using namespace address_wtf::objc_runtime_xx;
    using namespace address_wtf::objc_dynamic_associated_properties;

    template<typename T>
    void registerGetterAndSetterFactories(const char *typeEncoding = @encode(T))
    {
        NSCParameterAssert(typeEncoding);

        AccessorBlockFactoryRegistry::instance().registerGetterAndSetterFactories<T>(typeEncoding);
    }
    
    void dynamicAssociatedPropertiesRegisterSignle(Class cls, objc_property_t property)
    {
        NSCParameterAssert(cls);
        NSCParameterAssert(property);

        const PropertyAttributeList attributes(property);

        if (!attributes.isDynamic || attributes.isReadOnly)
        {
            return;
        }
        
        SEL getterSelector = attributes.getterSelector();
        SEL setterSelector = attributes.setterSelector();
        
        if (!getterSelector || !setterSelector || class_getInstanceMethod(cls, getterSelector) || class_getInstanceMethod(cls, setterSelector))
        {
            return;
        }
        
        objc_AssociationPolicy policy = attributes.getAssociationPolicy();
        const char *typeEncoding = attributes.typeEncoding[0] == '@' ? "@" : attributes.typeEncoding;
        
        const void *key = getterSelector;
        id getterBlock = AccessorBlockFactoryRegistry::instance().makeGetterBlock(typeEncoding, key, attributes.isWeak);
        id setterBlock = AccessorBlockFactoryRegistry::instance().makeSetterBlock(typeEncoding, key, attributes.isWeak, policy);
        
        if (getterBlock && setterBlock)
        {
            size_t typeEncodingLength = strlen(typeEncoding);
            char methodEncoding[typeEncodingLength + 3];
            
            IMP getterImp = imp_implementationWithBlock(getterBlock);
            sprintf(methodEncoding, "%s:@", typeEncoding);
            class_addMethod(cls, getterSelector, getterImp, methodEncoding);
            
            IMP setterImp = imp_implementationWithBlock(setterBlock);
            sprintf(methodEncoding, "v:%s", typeEncoding);
            class_addMethod(cls, setterSelector, setterImp, methodEncoding);
        }
        else
        {
            NSCAssert1(NO, @"dynamic associated properties of type '%s' not registered", typeEncoding);
        }
    }

    void dynamicAssociatedPropertiesRegisterAll(Class cls)
    {
        NSCParameterAssert(cls);

        const ClassPropertyList properties(cls);

        for (auto property: properties)
        {
            dynamicAssociatedPropertiesRegisterSignle(cls, property);
        }
    }

    class BoolGuard
    {
    public:
        BoolGuard(bool &lock): m_lock(lock) { m_lock = true; }
        ~BoolGuard() { m_lock = false; }

    private:
        bool &m_lock;
    };
}

@implementation NSObject (DynamicAssociatedProperties)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        registerGetterAndSetterFactories<id>("@");

        registerGetterAndSetterFactories<char>();
        registerGetterAndSetterFactories<unsigned char>();
        registerGetterAndSetterFactories<short>();
        registerGetterAndSetterFactories<unsigned short>();
        registerGetterAndSetterFactories<int>();
        registerGetterAndSetterFactories<unsigned int>();
        registerGetterAndSetterFactories<long>();
        registerGetterAndSetterFactories<unsigned long>();
        registerGetterAndSetterFactories<long long>();
        registerGetterAndSetterFactories<unsigned long long>();
        registerGetterAndSetterFactories<float>();
        registerGetterAndSetterFactories<double>();
        registerGetterAndSetterFactories<BOOL>();

        registerGetterAndSetterFactories<CGPoint>();
        registerGetterAndSetterFactories<CGVector>();
        registerGetterAndSetterFactories<CGSize>();
        registerGetterAndSetterFactories<CGRect>();
        registerGetterAndSetterFactories<CGAffineTransform>();
        registerGetterAndSetterFactories<UIEdgeInsets>();
        registerGetterAndSetterFactories<UIOffset>();

        registerGetterAndSetterFactories<CATransform3D>();

#if defined(DynamicAssociatedProperties_AutoResolve) && DynamicAssociatedProperties_AutoResolve
        method_exchangeImplementations(class_getClassMethod(self, @selector(resolveInstanceMethod:)),
                                       class_getClassMethod(self, @selector(dynamicAssociatedProperties_resolveInstanceMethod:)));
#endif
    });
}

+ (void)dynamicAssociatedPropertiesRegisterAll
{
    dynamicAssociatedPropertiesRegisterAll(self);
}

#if defined(DynamicAssociatedProperties_AutoResolve) && DynamicAssociatedProperties_AutoResolve
+ (BOOL)dynamicAssociatedPropertiesRegisterAllWithRecursionGuardAndCheck:(SEL)sel
{
    static bool recursionLock = NO;
    if (!recursionLock)
    {
        BoolGuard recursionGuard(recursionLock);
        [self dynamicAssociatedPropertiesRegisterAll];
        return [self instancesRespondToSelector:sel];
    }

    return NO;
    
}

+ (BOOL)dynamicAssociatedProperties_resolveInstanceMethod:(SEL)sel
{
    return [self dynamicAssociatedPropertiesRegisterAllWithRecursionGuardAndCheck:sel] || [self dynamicAssociatedProperties_resolveInstanceMethod:sel];
}
#endif

@end
