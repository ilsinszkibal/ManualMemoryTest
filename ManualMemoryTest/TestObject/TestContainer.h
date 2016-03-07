//
//  TestContainer.h
//  ManualMemoryTest
//
//  Created by Balazs Ilsinszki on 3/5/16.
//  Copyright © 2016 Balazs Ilsinszki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestContainer : NSObject
{
    NSMutableArray *_objectArray;
}

- (void)addObjects:(NSUInteger) numberOfObjects;
- (void)addObjectsAutoreleasePool:(NSUInteger) numberOfObjects;
- (void)addCascadeObjectForDepth:(NSUInteger) maxDepth;

@end
