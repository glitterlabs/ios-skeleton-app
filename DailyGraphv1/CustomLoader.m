//
//  CustomLoader.m
//  FreeMeUp
//
//  Created by Abhay Bhusari on 24/03/16.
//  Copyright © 2016 Abhay Bhusari. All rights reserved.
//

#import "CustomLoader.h"
#import "UIView+Autolayout.h"
#import "MBProgressHUD.h"

@interface CustomLoader ()



@end
@implementation CustomLoader

-(id)initWithLoaderMessage:(NSString *)loaderMsg
{
    self  = [super init];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        
        UIView *loaderView = [[UIView alloc]init];
        loaderView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        loaderView.layer.cornerRadius = 20.0;
        [self addSubview:loaderView];
        
        [loaderView enableAutolayout];
        [loaderView centerX];
        [loaderView centerY];
        [loaderView fixWidth:120];
        [loaderView fixHeight:120];
        
        UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [loaderView addSubview:activityIndicator];
        [activityIndicator startAnimating];
        [activityIndicator enableAutolayout];
        [activityIndicator centerX];
        [activityIndicator centerY];
        [activityIndicator fixWidth:25];
        [activityIndicator fixHeight:25];
    }
         return self;

}


@end
