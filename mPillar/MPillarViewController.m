//
//  Copyright (c) 2013 Myles Abbott. All rights reserved.
//

#import "MPillarViewController.h"

#import "UIView+Constraints.h"
#import "GreenBox.h"
#import "BlueBox.h"
#import "OrangeBox.h"

@interface MPillarViewController ()

@end

@implementation MPillarViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  UIView *redBox = [[UIView alloc] initWithFrame:CGRectZero];
  redBox.backgroundColor = [UIColor redColor];
  [self.view addSubview:redBox];
  
  GreenBox *greenBox = [[GreenBox alloc] initWithFrame:CGRectZero];
  [self.view addSubview:greenBox];
  
  BlueBox *blueBox = [[BlueBox alloc] initWithFrame:CGRectZero];
  [self.view addSubview:blueBox];
  
  OrangeBox *orangeBox = [[OrangeBox alloc] initWithFrame:CGRectZero];
  [self.view addSubview:orangeBox];
  
  id topGuide = self.topLayoutGuide; // iOS7
  
  NSDictionary *layoutViews = MXDictionaryOfVariableBindings(topGuide, redBox, greenBox, blueBox, orangeBox);
  [self.view addConstraintWithVisualFormat:@"H:|-[redBox(50)]-20-[greenBox]-(>=0)-[blueBox(60)]-|" bindings:layoutViews];
  
  [self.view addConstraintWithVisualFormat:@"V:|[topGuide][redBox(50)]" bindings:layoutViews];
  [self.view addConstraintWithVisualFormat:@"V:|[topGuide][greenBox]" bindings:layoutViews];
  [self.view addConstraintWithVisualFormat:@"V:|[topGuide][blueBox(190)]" bindings:layoutViews]; // under constrained
  
  [self.view addConstraintWithVisualFormat:@"H:|-[orangeBox(100)]" bindings:layoutViews];
  [self.view addConstraintWithVisualFormat:@"V:|[topGuide]-55-[orangeBox]-50-|" bindings:layoutViews];
  
  // Test constraint conflicts
  // [self.view addConstraintWithVisualFormat:@"H:[redBox(55)]" bindings:layoutViews];
  // [self.view addConstraintWithVisualFormat:@"H:[blueBox(66)]" bindings:layoutViews];
  
  [self addExampleButtonLabel];
}

- (void)addExampleButtonLabel
{
  UIColor *backingColor = [UIColor colorWithWhite:.9f alpha:1.f];
  
  UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
  label.text = @"Label";
  label.backgroundColor = backingColor;
  [self.view addSubview:label];
  
  UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"Button" forState:UIControlStateNormal];
  button.backgroundColor = backingColor;
  [self.view addSubview:button];
  
  // Try rotating the device - and watch if the Ambigious Layout elements change in a non predictable way.
  
  // GDB command, to help find AMBIGUOUS LAYOUT
  //   Pause the debugger
  //   po [[UIWindow keyWindow] _autolayoutTrace]
  //
  // Fix with:
  // [button setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
  
  NSDictionary *layoutViews = MXDictionaryOfVariableBindings(label, button);
  [self.view addConstraintWithVisualFormat:@"H:|-[label]-[button]-|" bindings:layoutViews];
  [self.view addConstraintWithVisualFormat:@"V:[button]-|" bindings:layoutViews];
  [self.view addConstraintWithVisualFormat:@"V:[label]-|" bindings:layoutViews];
}

@end
