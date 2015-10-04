# DynamicAssociatedProperties

[![CI Status](http://img.shields.io/travis/victor-pavlychko/DynamicAssociatedProperties.svg?style=flat)](https://travis-ci.org/victor-pavlychko/DynamicAssociatedProperties)
[![Version](https://img.shields.io/cocoapods/v/DynamicAssociatedProperties.svg?style=flat)](http://cocoapods.org/pods/DynamicAssociatedProperties)
[![License](https://img.shields.io/cocoapods/l/DynamicAssociatedProperties.svg?style=flat)](http://cocoapods.org/pods/DynamicAssociatedProperties)
[![Platform](https://img.shields.io/cocoapods/p/DynamicAssociatedProperties.svg?style=flat)](http://cocoapods.org/pods/DynamicAssociatedProperties)

## Introduction

DynamicAssociatedProperties library automatically generates accessors for `@dynamic` properties defined in categories using `objc_getAssociatedObject`/`objc_setAssociatedObject` for backing storage.

Supported property attributes:
* `strong`, `copy` and `assign` attributes implemented using runtime association policies
* `weak` attribute implemented using value holder object
* custom `getter` and `setter` specifications are properly parsed
* non-object typed are automatically boxed to `NSValue` or `NSNumber`
* C++ templates are used to easily generate type-safe accessors for any value type

Supported types:
* `char`
* `unsigned char`
* `short`
* `unsigned short`
* `int`
* `unsigned int`
* `long`
* `unsigned long`
* `long long`
* `unsigned long long`
* `float`
* `double`
* `BOOL`
* `CGPoint`
* `CGVector`
* `CGSize`
* `CGRect`
* `CGAffineTransform`
* `UIEdgeInsets`
* `UIOffset`
* `CATransform3D`
* any custom value type you register yourself

## Adding Properties in Category

To add properties in a category simply declate them in your `*.h` file as usual

```objc
@interface AWTestClass (AWTestCategory)

@property (copy)   NSString  *awStringProperty;
@property (weak)   id         awWeakProperty;
@property (assign) NSInteger  awIntegerProperty;
@property (assign) CGRect     awCGRectProperty;

@end
```

And define as `@dynamic` in your `*.m` file. Calling `+[NSObject dynamicAssociatedPropertiesRegisterAll]` will register all `@dynamic` properties for current class.

```objc
#include <DynamicAssociatedProperties/DynamicAssociatedProperties>

@implementation AWTestClass (AWTestCategory)

@dynamic awStringProperty;
@dynamic awWeakProperty;
@dynamic awIntegerProperty;
@dynamic awCGRectProperty;

+ (void)load
{
    [self dynamicAssociatedPropertiesRegisterAll];
}

@end
```

## Adding Support for Custom Types

Custom value types can be easily registered but type safe solution will require Objective-C++ file here. Simply rename your implementation file to `*.mm` and follow this syntax:

```objc
#include <DynamicAssociatedProperties/AccessorBlockFactoryRegistry.h>

@implementation AWTestClass (AWTestCategory)

+ (void)load
{
    AccessorBlockFactoryRegistry::instance().registerGetterAndSetterFactories<MyStructType>();
}

@end
```

When adding missing SDK structs consider extending `NSObject+DynamicAssociatedProperties.mm` and submitting pull request ;)

## Installation

DynamicAssociatedProperties is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DynamicAssociatedProperties"
```

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Alternatives

Several alternative projects are available:

* [YSDynamicProperties](https://github.com/youngshook/YSDynamicProperties)
* [DZLCategoryProperties](https://github.com/samdods/dynamicCategoryProperties)
* [ObjcAssociatedObjectHelpers](https://github.com/itsthejb/ObjcAssociatedObjectHelpers)
* [FTGPropertyMaestro](https://github.com/onmyway133/FTGPropertyMaestro)

## Author

Victor Pavlychko, victor.pavlychko@gmail.com

## License

DynamicAssociatedProperties is available under the MIT license. See the LICENSE file for more info.
