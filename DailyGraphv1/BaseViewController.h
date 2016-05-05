//
//  BaseViewController.h
//  FreeMeUp
//
//  Created by Abhay Bhusari on 28/03/16.
//  Copyright © 2016 Abhay Bhusari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomLoader.h"
@interface BaseViewController : UIViewController
-(void)showAlert:(NSString *)msg;
-(CustomLoader *)createLoader;

@end
