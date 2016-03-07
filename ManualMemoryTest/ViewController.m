//
//  ViewController.m
//  ManualMemoryTest
//
//  Created by Balazs Ilsinszki on 3/5/16.
//  Copyright © 2016 Balazs Ilsinszki. All rights reserved.
//

#import "ViewController.h"

#import "LifeCycleLogger.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)dealloc
{
    [_containerScrollView release];
    
    [_createContainerLabel release];
    [_autoReleaseSwitch release];
    
    [_addObjectsLabel release];
    [_numberOfObjectsField release];
    [_autopoolObjectsLabel release];
    [_autopoolSwitch release];
    
    [_addCascadeObjectLabel release];
    [_depthOfCascadeObjectField release];
    
    [_releaseContainerRefLabel release];
    [_releaseSwitch release];
    
    [_containerRefToZeroLabel release];
    
    [_button release];
    
    [_loggerVC release];
    
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _containerScrollView = [UIScrollView new];
    [self.view addSubview:_containerScrollView];
    
    //1. step
    _createContainerLabel = [[self createLabel] retain];
    _createContainerLabel.text = @"1. step: Create container. Autorelease?";
    [_containerScrollView addSubview:_createContainerLabel];
    
    _autoReleaseSwitch = [UISwitch new];
    [_containerScrollView addSubview:_autoReleaseSwitch];
    
    //2. step
    _addObjectsLabel = [[self createLabel] retain];
    _addObjectsLabel.text = @"2. step: Add objects with object number:";
    [_containerScrollView addSubview:_addObjectsLabel];
    
    
    _numberOfObjectsField = [[self createField] retain];
    _numberOfObjectsField.text = @"5";
    [_containerScrollView addSubview:_numberOfObjectsField];
    
    _autopoolObjectsLabel = [[self createLabel] retain];
    _autopoolObjectsLabel.text = @"Should create with AutoReleasePool?";
    [_containerScrollView addSubview:_autopoolObjectsLabel];
    
    _autopoolSwitch = [UISwitch new];
    [_containerScrollView addSubview:_autopoolSwitch];
    
    //3. step
    _addCascadeObjectLabel = [[self createLabel] retain];
    _addCascadeObjectLabel.text = @"3. step: Add cascade object with depth:";
    [_containerScrollView addSubview:_addCascadeObjectLabel];
    
    
    _depthOfCascadeObjectField = [[self createField] retain];
    _depthOfCascadeObjectField.text = @"3";
    [_containerScrollView addSubview:_depthOfCascadeObjectField];

    
    //4. step
    _releaseContainerRefLabel = [[self createLabel] retain];
    _releaseContainerRefLabel.text = @"4. step: Call release on container";
    [_containerScrollView addSubview:_releaseContainerRefLabel];
    
    
    _releaseSwitch = [UISwitch new];
    [_releaseSwitch setOn:YES animated:NO];
    [_containerScrollView addSubview:_releaseSwitch];
    
    
    //5. step
    _containerRefToZeroLabel = [[self createLabel] retain];
    _containerRefToZeroLabel.text = @"5. step: Set container reference nil?";
    [_containerScrollView addSubview:_containerRefToZeroLabel];
    
    _button = [[UIButton alloc] init];
    [_button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_button setTitle:@"Perform Action" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    [_button sizeToFit];
    [_containerScrollView addSubview:_button];
    
    _loggerVCButton = [[UIButton alloc] init];
    [_loggerVCButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_loggerVCButton setTitle:@"Open Log" forState:UIControlStateNormal];
    [_loggerVCButton addTarget:self action:@selector(openLogAction) forControlEvents:UIControlEventTouchUpInside];
    [_loggerVCButton sizeToFit];
    [_containerScrollView addSubview:_loggerVCButton];
}

#pragma mark - UIHelper

- (UILabel*)createLabel
{
    UILabel *label = [[UILabel alloc] init];
    return [label autorelease];
}

- (UITextField*)createField
{
    UITextField *field = [[UITextField alloc] init];
    field.textColor = [UIColor blueColor];
    field.keyboardType = UIKeyboardTypeDecimalPad;
    return [field autorelease];
}

#pragma mark - Layout

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat margin = 10;
    CGFloat labelHeight = 40;
    CGFloat paddingBetweenSteps = 20;
    
    [_containerScrollView setFrame:self.view.bounds];
    
    //Container elements
    CGFloat y = 60;
    [_autoReleaseSwitch setFrame:CGRectMake(self.view.frame.size.width - margin - 70, y, 70, labelHeight) ];
    [_createContainerLabel setFrame:CGRectMake(margin, y, self.view.frame.size.width - 2 * margin - 70, labelHeight) ];
    y += labelHeight + paddingBetweenSteps;
    
    [_numberOfObjectsField setFrame:CGRectMake(self.view.frame.size.width - margin - 40, y, 40, labelHeight) ];
    [_addObjectsLabel setFrame:CGRectMake(margin, y, self.view.frame.size.width - 2 * margin - 40, labelHeight) ];
    y += labelHeight;
    
    [_autopoolSwitch setFrame:CGRectMake(self.view.frame.size.width - margin - 70, y, 70, labelHeight) ];
    [_autopoolObjectsLabel setFrame:CGRectMake(margin, y, self.view.frame.size.width - 2 * margin - 70, labelHeight) ];
    y += labelHeight + paddingBetweenSteps;
    
    [_depthOfCascadeObjectField setFrame:CGRectMake(self.view.frame.size.width - margin - 40, y, 40, labelHeight) ];
    [_addCascadeObjectLabel setFrame:CGRectMake(margin, y, self.view.frame.size.width - 2 * margin - 40, labelHeight) ];
    y += labelHeight + paddingBetweenSteps;
    
    [_releaseSwitch setFrame:CGRectMake(self.view.frame.size.width - margin - 70, y, 70, labelHeight) ];
    [_releaseContainerRefLabel setFrame:CGRectMake(margin, y, self.view.frame.size.width - 2 * margin - 70, labelHeight) ];
    y += labelHeight + paddingBetweenSteps;
    
    [_containerRefToZeroLabel setFrame:CGRectMake(margin, y, self.view.frame.size.width - 2 * margin, labelHeight)];
    y += labelHeight + paddingBetweenSteps;
    
    [_button setFrame:CGRectMake( ( self.view.frame.size.width - _button.frame.size.width ) / 2.0, y, _button.frame.size.width, _button.frame.size.height) ];
    y += _button.frame.size.height + paddingBetweenSteps;
 
    y += paddingBetweenSteps;
    [_loggerVCButton setFrame:CGRectMake( self.view.frame.size.width - margin - _loggerVCButton.frame.size.width, y, _loggerVCButton.frame.size.width, _loggerVCButton.frame.size.height) ];
    y += _loggerVCButton.frame.size.height + paddingBetweenSteps;
    
    [_containerScrollView setContentSize:CGSizeMake(self.view.bounds.size.width, y) ];
}

#pragma mark - Private

- (TestContainer*)createContainer
{
    return [[[TestContainer alloc] init] autorelease];
}

#pragma mark - Actions

- (void)action
{
    //Clearing logs
    [[LifeCycleLogger sharedInstance] clearLog];
    
    LifeColorLog([UIColor purpleColor], @"ACTION START");
    
    //1. step
    BOOL autoreleaseContainer = [self autoreleaseContainerInput];
    if ( autoreleaseContainer )
        _testContainer = [[self createContainer] retain];
    else
        _testContainer = [[TestContainer alloc] init];
    
    //2. step
    NSUInteger objectNumberInput = [self objectNumberInput];
    BOOL isAutoReleasePool = [self autoreleasePool];
    if ( isAutoReleasePool )
        [_testContainer addObjectsAutoreleasePool:objectNumberInput];
    else
        [_testContainer addObjects:objectNumberInput];
    
    //3. step
    NSUInteger cascadeDepth = [self cascadeDepthInput];
    [_testContainer addCascadeObjectForDepth:cascadeDepth];
    
    //4. step
    BOOL releaseContainerInput = [self releaseContainerInput];
    if ( releaseContainerInput )
        [_testContainer release];
    
    //5. step
    _testContainer = nil;
    
    LifeColorLog([UIColor purpleColor], @"ACTION END");
}

- (void)openLogAction
{
    [_loggerVC release];
    _loggerVC = [[LifeCycleLoggerViewController alloc] init];
    
    [self presentViewController:_loggerVC animated:YES completion:nil];
}

#pragma mark - Input

- (NSUInteger)objectNumberInput
{
    NSString *numberOfObjects = _numberOfObjectsField.text;
    
    NSUInteger value = [numberOfObjects intValue];
    return value;
}

- (NSUInteger)cascadeDepthInput
{
    NSString *cascadeDepth = _depthOfCascadeObjectField.text;
    
    NSUInteger value = [cascadeDepth intValue];
    return value;
}

- (BOOL)releaseContainerInput
{
    return [_releaseSwitch isOn];
}

- (BOOL)autoreleaseContainerInput
{
    return [_autoReleaseSwitch isOn];
}

- (BOOL)autoreleasePool
{
    return [_autopoolSwitch isOn];
}

@end
