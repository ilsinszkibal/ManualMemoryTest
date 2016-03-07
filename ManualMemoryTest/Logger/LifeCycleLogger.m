//
//  LifeCycleLogger.m
//  ManualMemoryTest
//
//  Created by Balazs Ilsinszki on 3/5/16.
//  Copyright © 2016 Balazs Ilsinszki. All rights reserved.
//

#import "LifeCycleLogger.h"

@implementation LifeCycleLogger

static LifeCycleLogger *_instance;

#pragma mark - Singleton

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [LifeCycleLogger new];
    });
    
    return _instance;
}

#pragma mark - Public

- (void)log:(NSString *)message
{
    NSLog(@"%@", message);
}

- (void)log:(NSString *)message withColor:(UIColor *)color
{
    NSLog(@"%@", message);
}

@end
