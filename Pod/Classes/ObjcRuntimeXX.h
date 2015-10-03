//
//  ObjcRuntimeXX.hpp
//  Experiments
//
//  Created by Victor Pavlychko on 03.10.2015.
//  Copyright © 2015 Address WTF. All rights reserved.
//

#ifndef ObjcRuntimeXX_h
#define ObjcRuntimeXX_h

#import <objc/runtime.h>

namespace address_wtf {
namespace objc_runtime_xx {

    template<typename TItem, typename TOwner, TItem *(*Factory)(TOwner, unsigned int *)>
    struct RuntimeItemList
    {
        typedef const TItem *const_iterator;
        
        unsigned int size = 0;
        TItem *items = nullptr;
        
        explicit RuntimeItemList(TOwner owner)
        {
            items = Factory(owner, &size);
        }
        
        RuntimeItemList(RuntimeItemList &&other)
        {
            size = other.size;
            items = other.items;
            other.size = 0;
            other.items = nullptr;
        }
        
        RuntimeItemList(const RuntimeItemList &) = delete;
        
        RuntimeItemList &operator=(const RuntimeItemList &) = delete;
        
        ~RuntimeItemList()
        {
            free(items);
        }
        
        const_iterator begin() const
        {
            return items;
        }
        
        const_iterator end() const
        {
            return items + size;
        }
    };
    
    typedef RuntimeItemList<objc_property_t, Class, class_copyPropertyList> ClassPropertyList;
    
    struct PropertyAttributeList: public RuntimeItemList<objc_property_attribute_t, objc_property_t, property_copyAttributeList>
    {
        const char *name = nullptr;
        
        BOOL isReadOnly = NO;
        BOOL isCopy = NO;
        BOOL isRetain = NO;
        BOOL isNonAtomic = NO;
        BOOL isDynamic = NO;
        BOOL isWeak = NO;
        
        const char *typeEncoding = nullptr;
        const char *customGetterName = nullptr;
        const char *customSetterName = nullptr;
        
        explicit PropertyAttributeList(objc_property_t property): RuntimeItemList(property)
        {
            name = property_getName(property);
            
            for (auto &attribute: *this)
            {
                switch (attribute.name[0])
                {
                    case 'T':
                        typeEncoding = attribute.value;
                        break;
                    case 'R':
                        isReadOnly = YES;
                        break;
                    case 'C':
                        isCopy = YES;
                        break;
                    case '&':
                        isRetain = YES;
                        break;
                    case 'N':
                        isNonAtomic = YES;
                        break;
                    case 'G':
                        customGetterName = attribute.value;
                        break;
                    case 'S':
                        customSetterName = attribute.value;
                        break;
                    case 'D':
                        isDynamic = YES;
                        break;
                    case 'W':
                        isWeak = YES;
                        break;
                }
            }
        }
        
        objc_AssociationPolicy getAssociationPolicy() const
        {
            if (isRetain)
            {
                if (isNonAtomic)
                {
                    return OBJC_ASSOCIATION_RETAIN_NONATOMIC;
                }
                else
                {
                    return OBJC_ASSOCIATION_RETAIN;
                }
            }
            else if (isCopy)
            {
                if (isNonAtomic)
                {
                    return OBJC_ASSOCIATION_COPY_NONATOMIC;
                }
                else
                {
                    return OBJC_ASSOCIATION_COPY;
                }
            }
            else if (isWeak)
            {
                // retain holder as non-atomic
                return OBJC_ASSOCIATION_RETAIN_NONATOMIC;
            }
            else
            {
                return OBJC_ASSOCIATION_ASSIGN;
            }
        }
        
        SEL getterSelector() const
        {
            if (customGetterName)
            {
                return sel_getUid(customGetterName);
            }
            
            const char *getterName = name;
            return sel_getUid(getterName);
        }
        
        SEL setterSelector() const
        {
            if (customSetterName)
            {
                return sel_getUid(customSetterName);
            }
            
            size_t bufferSize = strlen(name) + 2;
            char setterName[bufferSize];
            sprintf(setterName, "set%c%s:", toupper(name[0]), name + 1);
            return sel_getUid(setterName);
        }
    };

}}

#endif /* ObjcRuntimeXX_h */
