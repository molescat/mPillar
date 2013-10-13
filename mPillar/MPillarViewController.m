//
//  Copyright (c) 2013 Myles Abbott. All rights reserved.
//

#import "MPillarViewController.h"

#import "UIView+Constraints.h"
#import "RedBox.h"
#import "GreenBox.h"
#import "OrangeBox.h"

@interface MPillarViewController ()

@end

@implementation MPillarViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  RedBox *boxRed = [[RedBox alloc] initWithFrame:CGRectZero];
  [self.view addSubview:boxRed];
  
  GreenBox *boxGreen = [[GreenBox alloc] initWithFrame:CGRectZero];
  [self.view addSubview:boxGreen];
  
  UIView *boxBlue = [[UIView alloc] initWithFrame:CGRectZero];
  boxBlue.backgroundColor = [UIColor blueColor];
  [self.view addSubview:boxBlue];
  
  OrangeBox *orangeBox = [[OrangeBox alloc] initWithFrame:CGRectZero];
  [self.view addSubview:orangeBox];
  
  UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"Button" forState:UIControlStateNormal];
  button.backgroundColor = [UIColor colorWithWhite:.9f alpha:1.f];
  [button setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
  [self.view addSubview:button];
  
  UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
  label.text = @"Label";
  label.backgroundColor = [UIColor colorWithWhite:.9f alpha:1.f];
  [self.view addSubview:label];
  
  id topGuide = self.topLayoutGuide; // iOS7
  
  NSDictionary *layoutViews = MXDictionaryOfVariableBindings(topGuide, boxRed, boxGreen, boxBlue, orangeBox, button, label);
  [self.view addConstraintWithVisualFormat:@"H:|-[boxRed]-(>=0)-[boxGreen(70)]-10-[boxBlue(50)]-|" bindings:layoutViews];
  
  [self.view addConstraintWithVisualFormat:@"V:|[topGuide][boxRed]" bindings:layoutViews];
  [self.view addConstraintWithVisualFormat:@"V:|[topGuide][boxGreen(150)]" bindings:layoutViews];
  [self.view addConstraintWithVisualFormat:@"V:[topGuide][boxBlue(50)]" bindings:layoutViews]; // under constrained
  
  [self.view addConstraintWithVisualFormat:@"H:|-[orangeBox(100)]" bindings:layoutViews];
  [self.view addConstraintWithVisualFormat:@"V:[orangeBox(300)]-50-|" bindings:layoutViews];
  
  [self.view addConstraintWithVisualFormat:@"H:|-[label]-[button]-|" bindings:layoutViews];
  [self.view addConstraintWithVisualFormat:@"V:[button]-|" bindings:layoutViews];
  [self.view addConstraintWithVisualFormat:@"V:[label]-|" bindings:layoutViews];
}

@end
