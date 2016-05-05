//
//  SignInViewController.h
//  DailyGraphv1
//
//  Created by Mohnish Basha Shaikh on 4/27/16.
//  Copyright © 2016 Mohnish Basha Shaikh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<Shephertz_App42_iOS_API/Shephertz_App42_iOS_API.h>
#import "customLoader.h"
#import "UIView+Autolayout.h"
#import "Preferences.h"
#import "CustomLoader.h"
#import "BaseViewController.h"
#import "SharedClass.h"
#import "UIView+Autolayout.h"
#import "homeViewController.h"


@interface SignInViewController : UIViewController<PreferenceDelegate>{



    IBOutlet UITextField *user;


    IBOutlet UITextField *pass;


   
    NSUserDefaults *userDefaults;
    CustomLoader *loader;


}
- (IBAction)login:(id)sender;

- (IBAction)forgetpassword:(id)sender;

@end
