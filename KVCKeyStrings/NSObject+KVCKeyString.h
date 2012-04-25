//
//  NSObject+KVCKeyString.h
//  KVCKeyStrings
//
//  Created by Doug Russell on 4/24/12.
//  Copyright (c) 2012 Doug Russell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESObjectPath.h"

extern NSString * const NSObjectKVCKeyStringNilObjectPathException;

@interface NSObject (KVCKeyString)

- (void)startObserving:(ESObjectPath *)objectPath options:(NSKeyValueObservingOptions)options context:(void *)context;
- (void)stopObserving:(ESObjectPath *)objectPath context:(void *)context;
- (void)stopObserving:(ESObjectPath *)objectPath;

@end
