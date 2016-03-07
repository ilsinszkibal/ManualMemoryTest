//
//  LifeCycleLogMessage.h
//  ManualMemoryTest
//
//  Created by Balazs Ilsinszki on 3/7/16.
//  Copyright © 2016 Balazs Ilsinszki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LifeCycleLogMessage : NSObject

@property (nonatomic, strong) NSString *messageText;
@property (nonatomic, strong) UIColor *messageColor;

@end
