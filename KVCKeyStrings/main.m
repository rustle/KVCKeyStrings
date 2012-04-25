//
//  main.m
//  KVCKeyStrings
//
//  Created by Doug Russell on 4/24/12.
//  Copyright (c) 2012 Doug Russell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+KVCKeyString.h"

@interface Observer : NSObject

@end

@implementation Observer

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
	NSLog(@"%@ %@ %@", object, keyPath, change);
}

@end

@interface SomeObject : NSObject

@property (strong, nonatomic) id someProperty;

@end

@implementation SomeObject
@synthesize someProperty=_someProperty;

@end

@interface SubclassTest : SomeObject

@end

@implementation SubclassTest

@end

@interface AnotherObject : NSObject

@property (strong, nonatomic) SomeObject *someObject;

@end

@implementation AnotherObject
@synthesize someObject=_someObject;

@end

int main(int argc, const char * argv[])
{
	@autoreleasepool {
		AnotherObject *anotherObject = [AnotherObject new];
		
		Observer *observer = [Observer new];
		
		[observer startObserving:ObjectPath(anotherObject, @"someObject.someProperty") options:NSKeyValueObservingOptionNew context:NULL];
		
		anotherObject.someObject = [SubclassTest new];
		
		anotherObject.someObject.someProperty = [NSObject new];
		
		[observer stopObserving:ObjectPath(anotherObject, @"someObject.someProperty")];
	}
	return 0;
}

