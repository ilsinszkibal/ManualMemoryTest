//
//  ViewController.h
//  ManualMemoryTest
//
//  Created by Balazs Ilsinszki on 3/5/16.
//  Copyright © 2016 Balazs Ilsinszki. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TestContainer.h"

#import "LifeCycleLoggerViewController.h"
#import "CodeCheckerViewController.h"

@interface ViewController : UIViewController
{
    UITapGestureRecognizer *_tapGesture;
    
    TestContainer *_testContainer;
    
    UIScrollView *_containerScrollView;
    
    UILabel *_createContainerLabel;
    UISwitch *_autoReleaseSwitch;
    
    UILabel *_addObjectsLabel;
    UITextField *_numberOfObjectsField;
    UILabel *_autopoolObjectsLabel;
    UISwitch *_autopoolSwitch;
    
    UILabel *_addCascadeObjectLabel;
    UITextField *_depthOfCascadeObjectField;
    
    UILabel *_releaseContainerRefLabel;
    UISwitch *_releaseSwitch;
    UILabel *_secondReleaseContainerRefLabel;
    UISwitch *_secondReleaseSwitch;
    
    UILabel *_containerRefToZeroLabel;
    
    UIButton *_button;
    
    //Buttons
    UIButton *_loggerVCButton;
    UIButton *_codeCheckerVCButton;
    
    CodeCheckerViewController *_codeCheckerVC;
    LifeCycleLoggerViewController *_loggerVC;
}


@end

