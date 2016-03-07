//
//  TestObject.m
//  ManualMemoryTest
//
//  Created by Balazs Ilsinszki on 3/5/16.
//  Copyright © 2016 Balazs Ilsinszki. All rights reserved.
//

#import "TestObject.h"

#import "LifeCycleLogger.h"

@implementation TestObject

- (instancetype)init
{
    self = [super init];
    
    if ( self )
    {
        LifeColorLog( [UIColor greenColor], @"INIT TestObject %@", self);
    }
    
    return self;
}

- (void)dealloc
{
    LifeColorLog( [UIColor greenColor], @"DEALLOC TestObject %@", self);
    
    [super dealloc];
}

@end
