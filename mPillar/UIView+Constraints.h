//
//  Copyright (c) 2013 Myles Abbott. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NSDictionary (MXConstraint)
+ (NSDictionary *)MXTranslateAutoresizingMaskIntoConstraints:(NSDictionary *)bindings;
@end

#define MXDictionaryOfVariableBindings(...) [NSDictionary MXTranslateAutoresizingMaskIntoConstraints:NSDictionaryOfVariableBindings(__VA_ARGS__)]

#pragma mark -

@interface UIView (Constraints)

- (void)addConstraintWithVisualFormat:(NSString *)format bindings:(NSDictionary *)bindings;

@end
