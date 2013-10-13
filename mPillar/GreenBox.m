//
//  Copyright (c) 2013 Myles Abbott. All rights reserved.
//

#import "GreenBox.h"
#import "UIView+Constraints.h"

@interface GreenBox ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation GreenBox

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self)
  {
    self.backgroundColor = [UIColor greenColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = @"The quick brown fox jumps over the lazy dog";
    label.numberOfLines = 0;
    [self addSubview:label];
    self.label = label;
    
    NSDictionary *layoutViews = MXDictionaryOfVariableBindings(label);
    [self addConstraintWithVisualFormat:@"H:|-2-[label]" bindings:layoutViews];
    [self addConstraintWithVisualFormat:@"V:|-2-[label]" bindings:layoutViews];
  }
  return self;
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  self.label.preferredMaxLayoutWidth = self.frame.size.width - 4.f;
  [super layoutSubviews];
}

@end
