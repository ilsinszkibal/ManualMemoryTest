//
//  ViewController.h
//  ManualMemoryTest
//
//  Created by Balazs Ilsinszki on 3/5/16.
//  Copyright © 2016 Balazs Ilsinszki. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TestContainer.h"

@interface ViewController : UIViewController
{
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
    
    UILabel *_containerRefToZeroLabel;
    
    UIButton *_button;
}


@end

