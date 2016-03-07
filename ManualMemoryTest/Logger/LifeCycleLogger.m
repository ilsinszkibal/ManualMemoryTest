//
//  LifeCycleLogger.m
//  ManualMemoryTest
//
//  Created by Balazs Ilsinszki on 3/5/16.
//  Copyright © 2016 Balazs Ilsinszki. All rights reserved.
//

#import "LifeCycleLogger.h"

@implementation LifeCycleLogger

@synthesize messageArray = _messageArray;

#pragma mark - Singleton

static LifeCycleLogger *_instance;

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [LifeCycleLogger new];
    });
    
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    
    if ( self )
    {
        _messageArray = [NSMutableArray new];
    }
    
    return self;
}

#pragma mark - Public

- (void)log:(NSString *)message
{
    [self log:message withColor:[UIColor blackColor] ];
}

- (void)log:(NSString *)message withColor:(UIColor *)color
{
    LifeCycleLogMessage *messageObject = [[LifeCycleLogMessage alloc] init];
    messageObject.messageText = message;
    messageObject.messageColor = color;
    
    [_messageArray addObject:messageObject];
}

- (void)clearLog
{
    [_messageArray removeAllObjects];
}

@end
