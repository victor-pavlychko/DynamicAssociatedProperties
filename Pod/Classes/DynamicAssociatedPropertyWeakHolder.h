//
//  DynamicAssociatedPropertyWeakHolder.h
//  Experiments
//
//  Created by Victor Pavlychko on 03.10.2015.
//  Copyright © 2015 Address WTF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DynamicAssociatedPropertyWeakHolder : NSObject

@property (nonatomic, weak, readonly) id value;

+ (instancetype)holderWithValue:(id)value;
- (instancetype)initWithValue:(id)value;

@end
