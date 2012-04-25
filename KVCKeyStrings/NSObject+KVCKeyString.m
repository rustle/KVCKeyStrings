//
//  NSObject+KVCKeyString.m
//  KVCKeyStrings
//
//  Created by Doug Russell on 4/24/12.
//  Copyright (c) 2012 Doug Russell. All rights reserved.
//

#import "NSObject+KVCKeyString.h"
#import "ESObjectPath.h"

NSString * const NSObjectKVCKeyStringNilObjectPathException = @"NSObjectKVCKeyStringNilObjectPathException";

#define CheckObjectPath \
if (objectPath == nil) \
{ \
	@throw [NSException exceptionWithName:NSObjectKVCKeyStringNilObjectPathException reason:@"" userInfo:nil]; \
}

@implementation NSObject (KVCKeyString)

- (void)startObserving:(ESObjectPath *)objectPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
	CheckObjectPath
	id object = [objectPath object];
	NSString *const keyPath = [objectPath keyPath];
	[object addObserver:self forKeyPath:keyPath options:options context:context];
}

- (void)stopObserving:(ESObjectPath *)objectPath context:(void *)context
{
	CheckObjectPath
	id object = [objectPath object];
	NSString *const keyPath = [objectPath keyPath];
	[object removeObserver:self forKeyPath:keyPath context:context];
}

- (void)stopObserving:(ESObjectPath *)objectPath
{
	CheckObjectPath
	id object = [objectPath object];
	NSString *const keyPath = [objectPath keyPath];
	[object removeObserver:self forKeyPath:keyPath];
}

@end
