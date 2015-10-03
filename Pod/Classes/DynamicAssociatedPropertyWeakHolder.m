//
//  DynamicAssociatedPropertyWeakHolder.m
//  Experiments
//
//  Created by Victor Pavlychko on 03.10.2015.
//  Copyright © 2015 Address WTF. All rights reserved.
//

#import "DynamicAssociatedPropertyWeakHolder.h"

@implementation DynamicAssociatedPropertyWeakHolder

@synthesize value = _value;

+ (instancetype)holderWithValue:(id)value
{
    return [[self alloc] initWithValue:value];
}

- (instancetype)initWithValue:(id)value
{
    if (self = [self init])
    {
        _value = value;
    }
    
    return self;
}

- (instancetype)copyWithZone:(NSZone *)zone
{
    return [[[self class] allocWithZone:zone] initWithValue:_value];
}

@end
