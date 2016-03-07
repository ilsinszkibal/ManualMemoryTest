//
//  TestContainer.m
//  ManualMemoryTest
//
//  Created by Balazs Ilsinszki on 3/5/16.
//  Copyright © 2016 Balazs Ilsinszki. All rights reserved.
//

#import "TestContainer.h"

#import "LifeCycleLogger.h"

#import "TestObject.h"
#import "TestCascadeObject.h"

@implementation TestContainer
{
    NSInteger ref;
}

- (instancetype)init
{
    self = [super init];
    
    if ( self )
    {
        ref = (NSInteger)self;
        LifeColorLog([UIColor blackColor], @"INIT TestContainer %@", self);
        
        _objectArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)dealloc
{
    LifeColorLog([UIColor blackColor], @"DEALLOC START TestContainer %@", self)
    
    [_objectArray release];
    
    LifeColorLog([UIColor blackColor], @"DEALLOC END TestContainer %@", self)
    
    [super dealloc];
}

#pragma mark - Private

- (TestObject*)createObject
{
    return [[[TestObject alloc] init] autorelease];
}

#pragma mark - Public

- (void)addObjects:(NSUInteger) numberOfObjects
{
    
    for (NSInteger act = 0; act < numberOfObjects; act++) {
        
        TestObject *object = [[TestObject alloc] init];
        
        if ( _objectArray )
            [_objectArray addObject:object];
        
        [object release];
    }
    
}

- (void)addObjectsAutoreleasePool:(NSUInteger) numberOfObjects
{
    for (NSInteger act = 0; act < numberOfObjects; act++) {
        
        @autoreleasepool {
            TestObject *object = [self createObject];
            
            if ( _objectArray )
                [_objectArray addObject:object];
        }
    
    }
}

- (void)addCascadeObjectForDepth:(NSUInteger) maxDepth
{
    TestCascadeObject *cascadeObject = [[TestCascadeObject alloc] initWithCurrentDepth:0 maximumDepth:maxDepth];
    
    if ( cascadeObject )
        [_objectArray addObject:cascadeObject];
    
    [cascadeObject release];
}

@end
