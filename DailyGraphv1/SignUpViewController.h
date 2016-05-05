//
//  SignUpViewController.h
//  DailyGraphv1
//
//  Created by Mohnish Basha Shaikh on 4/27/16.
//  Copyright © 2016 Mohnish Basha Shaikh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shephertz_App42_iOS_API/Shephertz_App42_iOS_API.h"
#import "UIView+Autolayout.h"
#import "Preferences.h"
#import "CustomLoader.h"
#import "BaseViewController.h"
#import "AppDelegate.h"
#import "SignInViewController.h"
#import <objc/runtime.h>

@interface SignUpViewController : UIViewController{
    
    
   // IBOutlet UITextField *Email;
    
    IBOutlet UITextField *email;
    IBOutlet UITextField *username;
    
    IBOutlet UITextField *UserName;
    IBOutlet UITextField *password;

}


- (IBAction)Register:(id)sender;


















@end
