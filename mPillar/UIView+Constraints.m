//
//  Copyright (c) 2013 Myles Abbott. All rights reserved.
//

#import "UIView+Constraints.h"

@implementation NSDictionary (MXConstraint)

+ (NSDictionary *)MXTranslateAutoresizingMaskIntoConstraints:(NSDictionary *)bindings
{
  for (id key in bindings)
  {
    UIView *view = (UIView *)[bindings objectForKey:key];
    view.translatesAutoresizingMaskIntoConstraints = NO;
  }
  return bindings;
}

@end

#pragma mark -

@implementation UIView (Constraints)

- (void)addConstraintWithVisualFormat:(NSString *)format bindings:(NSDictionary *)bindings
{
  [self addConstraints:
   [NSLayoutConstraint constraintsWithVisualFormat:format
                                           options:0
                                           metrics:nil
                                             views:bindings]];
}

@end
