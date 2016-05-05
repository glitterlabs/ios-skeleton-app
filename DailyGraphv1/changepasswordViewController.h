//
//  changepasswordViewController.h
//  DailyGraphv1
//
//  Created by Mohnish Basha Shaikh on 4/30/16.
//  Copyright © 2016 Mohnish Basha Shaikh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Shephertz_App42_iOS_API/Shephertz_App42_iOS_API.h>
#import "CustomLoader.h"
#import "MBProgressHUD.h"
#import "UIView+Autolayout.h"
#import "Constants.h"
#import "Preferences.h"
#import "SharedClass.h"




@interface changepasswordViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *oldPass;

@property (strong, nonatomic) IBOutlet UITextField *nPasword;

@property (strong, nonatomic) IBOutlet UITextField *confirmpassword;


- (IBAction)changePassword:(id)sender;
- (IBAction)backButton:(id)sender;



@end
