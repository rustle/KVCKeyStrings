//
//  ESObjectPath.m
//  KVCKeyStrings
//
//  Created by Doug Russell on 4/24/12.
//  Copyright (c) 2012 Doug Russell. All rights reserved.
//

#import "ESObjectPath.h"
#import "NSObject+PropertyDictionary.h"

NSString * const ESObjectPathNilObjectException = @"ESObjectPathNilObjectException";
NSString * const ESObjectPathNilKeyPathException = @"ESObjectPathNilKeyPathException";
NSString * const ESObjectPathInvalidKeyPathException = @"ESObjectPathInvalidKeyPathException";

@implementation ESObjectPath
{
	id _object;
	NSString *_keyPath;
}

- (id)object
{
	return _object;
}

- (NSString *const)keyPath
{
	return _keyPath;
}

+ (instancetype)newObjectPathWithObject:(id)object keyPath:(NSString *const)keyPath
{
	return [[[self class] alloc] initWithObject:object keyPath:keyPath];
}

- (instancetype)initWithObject:(id)object keyPath:(NSString *const)keyPath
{
	if (object == nil)
	{
		@throw [NSException exceptionWithName:ESObjectPathNilObjectException reason:@"Attempted to create object path with nil object" userInfo:nil];
		return nil;
	}
	if (keyPath == nil)
	{
		@throw [NSException exceptionWithName:ESObjectPathNilKeyPathException reason:@"Attempted to create object path with nil key path" userInfo:nil];
		return nil;
	}
	NSArray *components = [keyPath componentsSeparatedByString:@"."];
	Class currentObjectClass = [object class];
	for (int i = 0; i < [components count]; i++)
	{
		NSString *component = [components objectAtIndex:i];
		NSDictionary *propertyDictionary = GetPropertyDictionary(currentObjectClass, YES);
		ESDeclaredPropertyAttributes *attributes = [propertyDictionary objectForKey:component];
		if (attributes == nil)
		{
			@throw [NSException exceptionWithName:ESObjectPathInvalidKeyPathException reason:[NSString stringWithFormat:@"Attempted to create object path with keypath not supported by object: %@ - %@", object, keyPath] userInfo:nil];
			return nil;
		}
		if (i < [components count] - 1)
		{
			currentObjectClass = NSClassFromString(attributes.classString);
		}
	}
	self = [super init];
	if (self)
	{
		_object = object;
		_keyPath = keyPath;
	}
	return self;
}

@end
