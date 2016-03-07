//
//  LifeCycleLoggerViewController.m
//  ManualMemoryTest
//
//  Created by Balazs Ilsinszki on 3/7/16.
//  Copyright © 2016 Balazs Ilsinszki. All rights reserved.
//

#import "LifeCycleLoggerViewController.h"

#import "LifeCycleLogger.h"

@implementation LifeCycleLoggerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _backButton = [UIButton new];
    [_backButton setTitle:@"Back" forState:UIControlStateNormal];
    [_backButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_backButton sizeToFit];
    [self.view addSubview:_backButton];
    
    _titleLabel = [UILabel new];
    _titleLabel.text = @"Log output";
    [self.view addSubview:_titleLabel];
    
    _textView = [UITextView new];
    [self.view addSubview:_textView];
    
    [self setupTextViewContent];
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat margin = 15.0;
    
    [_backButton setFrame:CGRectMake(margin, 30, _backButton.frame.size.width, _backButton.frame.size.height) ];
    
    CGFloat titleMargin = self.view.frame.size.width / 2.0 - _backButton.frame.size.width / 2.0 - margin;
    [_titleLabel setFrame:CGRectMake(titleMargin, 0, self.view.frame.size.width - 2 * titleMargin, 40) ];
    
    
    [_textView setFrame:CGRectMake(margin, 80, self.view.frame.size.width - 2 * margin, self.view.frame.size.height - 80) ];
}

#pragma mark - Private

- (void)setupTextViewContent
{
    NSMutableArray *messageArray = [[LifeCycleLogger sharedInstance] messageArray];
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"" attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:16] } ];
    
    for (LifeCycleLogMessage *message in messageArray) {
        
        NSDictionary *messageAttributes = @{ NSForegroundColorAttributeName : message.messageColor };
        NSString *messageToPass = [NSString stringWithFormat:@"%@\n", message.messageText];
        NSAttributedString *messageString = [[NSAttributedString alloc] initWithString:messageToPass attributes:messageAttributes];
        
        [string appendAttributedString:messageString];
    }
    
    _textView.attributedText = string;
}

#pragma mark - Action

- (void)backButtonAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
