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
  
  UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
  label.text = @"Label";
  label.backgroundColor = [UIColor colorWithWhite:.9f alpha:1.f];
  [self.view addSubview:label];
  
  UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"Button" forState:UIControlStateNormal];
  button.backgroundColor = [UIColor colorWithWhite:.9f alpha:1.f];
  [button setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
  [self.view addSubview:button];
  
  id topGuide = self.topLayoutGuide; // iOS7
  
  NSDictionary *layoutViews = MXDictionaryOfVariableBindings(topGuide, redBox, greenBox, blueBox, orangeBox, label, button);
  [self.view addConstraintWithVisualFormat:@"H:|-[redBox(50)]-20-[greenBox]-(>=0)-[blueBox(60)]-|" bindings:layoutViews];
  
  [self.view addConstraintWithVisualFormat:@"V:|[topGuide][redBox(50)]" bindings:layoutViews];
  [self.view addConstraintWithVisualFormat:@"V:|[topGuide][greenBox]" bindings:layoutViews];
  [self.view addConstraintWithVisualFormat:@"V:|[topGuide][blueBox(190)]" bindings:layoutViews]; // under constrained
  
  [self.view addConstraintWithVisualFormat:@"H:|-[orangeBox(100)]" bindings:layoutViews];
  [self.view addConstraintWithVisualFormat:@"V:|[topGuide]-55-[orangeBox]-50-|" bindings:layoutViews];
  
  [self.view addConstraintWithVisualFormat:@"H:|-[label]-[button]-|" bindings:layoutViews];
  [self.view addConstraintWithVisualFormat:@"V:[button]-|" bindings:layoutViews];
  [self.view addConstraintWithVisualFormat:@"V:[label]-|" bindings:layoutViews];
}

@end
