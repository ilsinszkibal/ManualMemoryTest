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
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.text = @"Log output";
    [self.view addSubview:_titleLabel];
    
    _textView = [UITextView new];
    [self.view addSubview:_textView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setupTextViewContent];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat margin = 15.0;
    
    [_backButton setFrame:CGRectMake(margin, 30, _backButton.frame.size.width, _backButton.frame.size.height) ];
    
    CGFloat titleMargin = _backButton.frame.size.width + margin;
    [_titleLabel setFrame:CGRectMake(titleMargin, 24, self.view.frame.size.width - 2 * titleMargin, 40) ];
    
    
    [_textView setFrame:CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height - 80) ];
}

#pragma mark - Private

- (void)setupTextViewContent
{
    NSMutableArray *messageArray = [[LifeCycleLogger sharedInstance] messageArray];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"" attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:16] } ];
    
    for (LifeCycleLogMessage *message in messageArray) {
        
        NSDictionary *messageAttributes = @{ NSForegroundColorAttributeName : message.messageColor };
        NSString *messageToPass = [NSString stringWithFormat:@"%@\n", message.messageText];
        NSAttributedString *messageString = [[NSAttributedString alloc] initWithString:messageToPass attributes:messageAttributes];
        
        [attributedString appendAttributedString:messageString];
    }
    
    if ( [attributedString.string length] == 0 )
    {
        NSAttributedString *noContent = [[NSAttributedString alloc] initWithString:@"Nothing to present"];
        [attributedString appendAttributedString:noContent];
    }
    
    _textView.attributedText = attributedString;
}

#pragma mark - Action

- (void)backButtonAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
