//
//  TestCascadeObject.m
//  ManualMemoryTest
//
//  Created by Balazs Ilsinszki on 3/5/16.
//  Copyright © 2016 Balazs Ilsinszki. All rights reserved.
//

#import "TestCascadeObject.h"

#import "LifeCycleLogger.h"

@implementation TestCascadeObject

- (instancetype)initWithCurrentDepth:(NSUInteger) depth maximumDepth:(NSUInteger) maximumDepth;
{
    //Control cascade
    if ( maximumDepth < depth )
        return nil;
    
    self = [super init];
    
    if ( self )
    {
        _depth = depth;
        
        _refObject = [[TestCascadeObject alloc] initWithCurrentDepth:( _depth + 1 ) maximumDepth:maximumDepth];
        
        LifeColorLog([UIColor blueColor], @"INIT TestCascadeObject %@ for depth %ld", self, (unsigned long)depth);
    }
    
    return self;
}

- (void)dealloc
{
    LifeColorLog([UIColor blueColor], @"DEALLOC START TestCascadeObject %@ for depth %ld", self, (unsigned long)_depth);
    
    [_refObject release];
    
    LifeColorLog([UIColor blueColor], @"DEALLOC END TestCascadeObject %@ for depth %ld", self, (unsigned long)_depth);
    
    [super dealloc];
}

@end
