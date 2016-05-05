#import "UIView+Autolayout.h"

@implementation UIView (Autolayout)

-(void)enableAutolayout
{
  [self setTranslatesAutoresizingMaskIntoConstraints:NO];
}

-(void)topMargin:(CGFloat)pixels
{
  
  NSAssert(self.translatesAutoresizingMaskIntoConstraints == NO, @"Please enable your view for autolayout using enableAutolayout");
  NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTop multiplier:1 constant:pixels];
  
  [self.superview addConstraint:contraint];
}

-(void)bottomMargin:(CGFloat)pixels
{
  
  NSAssert(self.translatesAutoresizingMaskIntoConstraints == NO, @"Please enable your view for autolayout using enableAutolayout");
  NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeBottom multiplier:1 constant:-pixels];
  
  [self.superview addConstraint:contraint];
}


-(void)bottomMarginSmaller:(CGFloat)pixels
{
  
  NSAssert(self.translatesAutoresizingMaskIntoConstraints == NO, @"Please enable your view for autolayout using enableAutolayout");
  NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.superview attribute:NSLayoutAttributeBottom multiplier:1 constant:-pixels];
  
  [self.superview addConstraint:contraint];
}




-(void)belowView:(CGFloat)pixels  toView:(UIView*)toView
{
  
  NSAssert(self.translatesAutoresizingMaskIntoConstraints == NO, @"Please enable your view for autolayout using enableAutolayout");
  NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:toView attribute:NSLayoutAttributeBottom multiplier:1 constant:pixels];
  
  [self.superview addConstraint:contraint];
}





-(void)leadingMargin:(CGFloat)pixels
{
  NSAssert(self.translatesAutoresizingMaskIntoConstraints == NO, @"Please enable your view for autolayout using enableAutolayout");
  
  NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeLeading multiplier:1 constant:pixels];
  
  [self.superview addConstraint:contraint];
}





-(void)trailingMargin:(CGFloat)pixels
{
  
  NSAssert(self.translatesAutoresizingMaskIntoConstraints == NO, @"Please enable your view for autolayout using enableAutolayout");
  NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTrailing multiplier:1 constant:-pixels];
  
  [self.superview addConstraint:contraint];
}

-(void)addToRight:(CGFloat)pixels  ofView:(UIView*)view
{
  
  NSAssert(self.translatesAutoresizingMaskIntoConstraints == NO, @"Please enable your view for autolayout using enableAutolayout");
  NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTrailing multiplier:1 constant:pixels];
  
  [self.superview addConstraint:contraint];
}

-(void)addToLeft:(CGFloat)pixels  ofView:(UIView*)view
{
  NSAssert(self.translatesAutoresizingMaskIntoConstraints == NO, @"Please enable your view for autolayout using enableAutolayout");
  NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeading multiplier:1 constant:-pixels];
  
  [self.superview addConstraint:contraint];
}


-(void)fixWidth:(CGFloat)pixels
{
  
  NSAssert(self.translatesAutoresizingMaskIntoConstraints == NO, @"Please enable your view for autolayout using enableAutolayout");
  NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:pixels];
  
  [self.superview addConstraint:contraint];
}

-(void)flexibleWidthGreater:(CGFloat)pixels
{
  
  NSAssert(self.translatesAutoresizingMaskIntoConstraints == NO, @"Please enable your view for autolayout using enableAutolayout");
  NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:pixels];
  
  [self.superview addConstraint:contraint];
}

-(void)flexibleWidthSmaller:(CGFloat)pixels
{
  
  NSAssert(self.translatesAutoresizingMaskIntoConstraints == NO, @"Please enable your view for autolayout using enableAutolayout");
  NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:pixels];
  
  [self.superview addConstraint:contraint];
}


-(void)fixHeight:(CGFloat)pixels
{
  
  NSAssert(self.translatesAutoresizingMaskIntoConstraints == NO, @"Please enable your view for autolayout using enableAutolayout");
  NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:pixels];
  
  [self.superview addConstraint:contraint];
}

-(void)flexibleHeightGreater:(CGFloat)pixels
{
  
  NSAssert(self.translatesAutoresizingMaskIntoConstraints == NO, @"Please enable your view for autolayout using enableAutolayout");
  NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:pixels];
  
  [self.superview addConstraint:contraint];
}

-(void)flexibleHeightSmaller:(CGFloat)pixels
{
  
  NSAssert(self.translatesAutoresizingMaskIntoConstraints == NO, @"Please enable your view for autolayout using enableAutolayout");
  NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:pixels];
  
  [self.superview addConstraint:contraint];
}



-(void)centerX
{
  
  NSAssert(self.translatesAutoresizingMaskIntoConstraints == NO, @"Please enable your view for autolayout using enableAutolayout");
  NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
  
  [self.superview addConstraint:contraint];
}


-(void)centerY
{
  
  NSAssert(self.translatesAutoresizingMaskIntoConstraints == NO, @"Please enable your view for autolayout using enableAutolayout");
  NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
  
  [self.superview addConstraint:contraint];
}

-(void)centerXToView:(UIView *)mainView
{
    
    NSAssert(self.translatesAutoresizingMaskIntoConstraints == NO, @"Please enable your view for autolayout using enableAutolayout");
    NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:mainView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    
    [self.superview addConstraint:contraint];
}


-(void)centerYToView:(UIView *)mainView
{
    
    NSAssert(self.translatesAutoresizingMaskIntoConstraints == NO, @"Please enable your view for autolayout using enableAutolayout");
    NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:mainView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    [self.superview addConstraint:contraint];
}


-(void)equalWidthToView:(UIView *)secondView
{
    
    NSAssert(self.translatesAutoresizingMaskIntoConstraints == NO, @"Please enable your view for autolayout using enableAutolayout");
    NSLayoutConstraint *contraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:secondView attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    
    [self.superview addConstraint:contraint];
}

@end
