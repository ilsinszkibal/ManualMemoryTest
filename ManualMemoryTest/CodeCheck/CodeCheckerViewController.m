//
//  CodeCheckerViewController.m
//  ManualMemoryTest
//
//  Created by Balazs Ilsinszki on 3/7/16.
//  Copyright © 2016 Balazs Ilsinszki. All rights reserved.
//

#import "CodeCheckerViewController.h"

@implementation CodeCheckerViewController

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
    _titleLabel.text = @"Check code";
    [self.view addSubview:_titleLabel];
    
    _webView = [[UIWebView alloc] init];
    [self.view addSubview:_webView];
    
    [self loadGitHub];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat margin = 15.0;
    
    [_backButton setFrame:CGRectMake(margin, 30, _backButton.frame.size.width, _backButton.frame.size.height) ];
    
    CGFloat titleMargin = _backButton.frame.size.width + margin;
    [_titleLabel setFrame:CGRectMake(titleMargin, 24, self.view.frame.size.width - 2 * titleMargin, 40) ];
    
    [_webView setFrame:CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height - 80) ];
}

#pragma mark - Private

- (void)loadGitHub
{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://github.com/ilsinszkibal/ManualMemoryTest/tree/master/ManualMemoryTest"] ];
    [_webView loadRequest:request];
}

#pragma mark - Action

- (void)backButtonAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
