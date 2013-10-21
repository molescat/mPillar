//
//  Copyright (c) 2013 Myles Abbott. All rights reserved.
//

#import "RedBox.h"

@implementation RedBox

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self)
  {
    self.backgroundColor = [UIColor redColor];
  }
  return self;
}

- (CGSize)intrinsicContentSize
{
  return CGSizeMake(50.f, 50.f);
}

@end
