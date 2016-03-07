//
//  TestCascadeObject.h
//  ManualMemoryTest
//
//  Created by Balazs Ilsinszki on 3/5/16.
//  Copyright © 2016 Balazs Ilsinszki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestCascadeObject : NSObject
{
    TestCascadeObject *_refObject;
    NSUInteger _depth;
}

- (instancetype)initWithCurrentDepth:(NSUInteger) depth maximumDepth:(NSUInteger) maximumDepth;

@end
