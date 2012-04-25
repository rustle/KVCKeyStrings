//
//  ESObjectPath.h
//  KVCKeyStrings
//
//  Created by Doug Russell on 4/24/12.
//  Copyright (c) 2012 Doug Russell. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const ESObjectPathNilObjectException;
extern NSString * const ESObjectPathNilKeyPathException;
extern NSString * const ESObjectPathInvalidKeyPathException;

#define ObjectPath(objectValue, keyPathValue) [ESObjectPath newObjectPathWithObject:objectValue keyPath:keyPathValue]

@interface ESObjectPath : NSObject

- (id)object;
- (NSString *const)keyPath;

+ (instancetype)newObjectPathWithObject:(id)object keyPath:(NSString *const)keyPath;
- (instancetype)initWithObject:(id)object keyPath:(NSString *const)keyPath;

@end
