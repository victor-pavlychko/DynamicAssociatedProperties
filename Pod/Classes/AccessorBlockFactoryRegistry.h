//
//  AccessorBlockFactoryRegistry.hpp
//  Experiments
//
//  Created by Victor Pavlychko on 03.10.2015.
//  Copyright © 2015 Address WTF. All rights reserved.
//

#ifndef AccessorBlockFactoryRegistry_h
#define AccessorBlockFactoryRegistry_h

#import <objc/runtime.h>
#import "AccessorBlockFactories.h"

namespace address_wtf {
namespace objc_dynamic_associated_properties {

    class AccessorBlockFactoryRegistry
    {
    public:
        typedef id (*getter_block_factory_t)(const void *);
        typedef id (*setter_block_factory_t)(const void *, objc_AssociationPolicy);
        typedef std::map<std::string, getter_block_factory_t> getter_block_factory_map_t;
        typedef std::map<std::string, setter_block_factory_t> setter_block_factory_map_t;
        
        static AccessorBlockFactoryRegistry &instance()
        {
            static AccessorBlockFactoryRegistry *instance = nullptr;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                instance = new AccessorBlockFactoryRegistry();
            });
            
            return *instance;
        }
        
        void registerGetterAndSetterFactories(const char *typeEncoding, getter_block_factory_t getterBlockFactory, setter_block_factory_t setterBlockFactory)
        {
            NSCParameterAssert(typeEncoding);
            NSCParameterAssert(getterBlockFactory);
            NSCParameterAssert(setterBlockFactory);

            m_getterBlockFactoryMap.emplace(typeEncoding, getterBlockFactory);
            m_setterBlockFactoryMap.emplace(typeEncoding, setterBlockFactory);
        }
        
        template<typename T>
        void registerGetterAndSetterFactories(const char *typeEncoding = @encode(T))
        {
            NSCParameterAssert(typeEncoding);

            registerGetterAndSetterFactories(typeEncoding, accessor_block_factories::getterBlockFactory<T>, accessor_block_factories::setterBlockFactory<T>);
        }
        
        id makeGetterBlock(const char *typeEncoding, const void *key, BOOL isWeak) const
        {
            NSCParameterAssert(typeEncoding);
            NSCParameterAssert(key);

            if (isWeak)
            {
                NSCAssert(typeEncoding[0] == '@', @"weak policy is allowed for objects only");
                return accessor_block_factories::getterWeakBlockFactory(key);
            }
            
            auto &map = m_getterBlockFactoryMap;
            auto item = map.find(typeEncoding);
            return item == map.end() ? nil : item->second(key);
        }
        
        id makeSetterBlock(const char *typeEncoding, const void *key, BOOL isWeak, objc_AssociationPolicy policy) const
        {
            NSCParameterAssert(typeEncoding);
            NSCParameterAssert(key);

            if (isWeak)
            {
                NSCAssert(typeEncoding[0] == '@', @"weak policy is allowed for objects only");
                return accessor_block_factories::setterWeakBlockFactory(key, policy);
            }

            NSCAssert(typeEncoding[0] == '@' || policy == OBJC_ASSOCIATION_ASSIGN, @"value types support only assign policy");

            auto &map = m_setterBlockFactoryMap;
            auto item = map.find(typeEncoding);
            return item == map.end() ? nil : item->second(key, policy);
        }
        
    private:
        AccessorBlockFactoryRegistry() { }
        
        AccessorBlockFactoryRegistry(const AccessorBlockFactoryRegistry &) = delete;
        AccessorBlockFactoryRegistry &operator=(const AccessorBlockFactoryRegistry &) = delete;
        
    private:
        getter_block_factory_t m_getterWeakFactory;
        setter_block_factory_t m_setterWeakFactory;
        getter_block_factory_map_t m_getterBlockFactoryMap;
        setter_block_factory_map_t m_setterBlockFactoryMap;
    };

}}

#endif /* AccessorBlockFactoryRegistry_h */
