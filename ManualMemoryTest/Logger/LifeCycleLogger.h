//
//  LifeCycleLogger.h
//  ManualMemoryTest
//
//  Created by Balazs Ilsinszki on 3/5/16.
//  Copyright © 2016 Balazs Ilsinszki. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LifeLog( A, ...) [[LifeCycleLogger sharedInstance] log:[NSString stringWithFormat: A, ## __VA_ARGS__,nil ] ];
#define LifeColorLog( A, B, ...) [[LifeCycleLogger sharedInstance] log:[NSString stringWithFormat: B, ## __VA_ARGS__,nil ] withColor: A ];


@interface LifeCycleLogger : NSObject

+ (instancetype)sharedInstance;

- (void)log:(NSString *)message;
- (void)log:(NSString *)message withColor:(UIColor *)color;

@end
