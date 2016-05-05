#import <UIKit/UIKit.h>

@interface UIView (Autolayout)


-(void)enableAutolayout;


-(void)topMargin:(CGFloat)pixels;
-(void)bottomMargin:(CGFloat)pixels;
-(void)leadingMargin:(CGFloat)pixels;
-(void)trailingMargin:(CGFloat)pixels;

-(void)bottomMarginSmaller:(CGFloat)pixels;

-(void)addToRight:(CGFloat)pixels  ofView:(UIView*)view;
-(void)addToLeft:(CGFloat)pixels  ofView:(UIView*)view;
-(void)belowView:(CGFloat)pixels  toView:(UIView*)toView;


-(void)fixWidth:(CGFloat)pixels;
-(void)flexibleWidthGreater:(CGFloat)pixels;
-(void)flexibleWidthSmaller:(CGFloat)pixels;


-(void)fixHeight:(CGFloat)pixels;
-(void)flexibleHeightGreater:(CGFloat)pixels;
-(void)flexibleHeightSmaller:(CGFloat)pixels;


-(void)centerX;
-(void)centerY;

-(void)centerXToView:(UIView *)mainView;
-(void)centerYToView:(UIView *)mainView;

-(void)equalWidthToView:(UIView *)secondView;
@end
