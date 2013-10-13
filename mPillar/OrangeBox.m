//
//  Copyright (c) 2013 Myles Abbott. All rights reserved.
//
// See UIScrollView And Autolayout
// http://developer.apple.com/library/ios/technotes/tn2154/_index.html

#import "OrangeBox.h"
#import "UIView+Constraints.h"

@implementation OrangeBox

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self)
  {
    self.backgroundColor = [UIColor orangeColor];
    
    UIImageView *catBox = [[UIImageView alloc] init];
    catBox.image = [UIImage imageNamed:@"businessCat"];
    [self addSubview:catBox];
    
    UIView *whiteBox = [[UIView alloc] initWithFrame:CGRectZero];
    whiteBox.backgroundColor = [UIColor whiteColor];
    [self addSubview:whiteBox];
    
    UIView *grayBox = [[UIView alloc] initWithFrame:CGRectZero];
    grayBox.backgroundColor = [UIColor grayColor];
    [self addSubview:grayBox];
    
    NSDictionary *layoutViews = MXDictionaryOfVariableBindings(catBox, whiteBox, grayBox);
    [self addConstraintWithVisualFormat:@"V:|[catBox]-50-[whiteBox(60)]-50-[grayBox(60)]|" bindings:layoutViews];
    [self addConstraintWithVisualFormat:@"H:|-20-[grayBox(60)]" bindings:layoutViews];
    [self addConstraintWithVisualFormat:@"H:|-20-[whiteBox(60)]" bindings:layoutViews];
    [self addConstraintWithVisualFormat:@"H:|[catBox]|" bindings:layoutViews];
  }
  return self;
}


@end
