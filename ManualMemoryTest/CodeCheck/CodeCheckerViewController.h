//
//  CodeCheckerViewController.h
//  ManualMemoryTest
//
//  Created by Balazs Ilsinszki on 3/7/16.
//  Copyright © 2016 Balazs Ilsinszki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CodeCheckerViewController : UIViewController<UIWebViewDelegate>
{
    UIButton *_backButton;
    UILabel *_titleLabel;
    
    UIActivityIndicatorView *_activityIndicator;
    UIWebView *_webView;
}

@end
