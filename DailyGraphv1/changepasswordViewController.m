//
//  changepasswordViewController.m
//  DailyGraphv1
//
//  Created by Mohnish Basha Shaikh on 4/30/16.
//  Copyright © 2016 Mohnish Basha Shaikh. All rights reserved.
//

#import "changepasswordViewController.h"

@interface changepasswordViewController ()

@end

@implementation changepasswordViewController
@synthesize oldPass,nPasword,confirmpassword;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changePassword:(id)sender {
    NSString *userName = oldPass.text;
    NSString *oldPwd = nPasword.text;
    NSString *newPwd = confirmpassword.text;
    [App42API initializeWithAPIKey:@"APP_KEY" andSecretKey:@"SECRET_KEY"];
    UserService *userService = [App42API buildUserService];
    [userService changeUserPassword:userName oldPassword:oldPwd newPassword:newPwd completionBlock:^(BOOL success, id responseObj, App42Exception *exception)
    {
        if (success)
        {
            App42Response *response = (App42Response*)responseObj;
           // NSString *success = response.isResponseSuccess;
            
            NSString *jsonResponse = [response toString];
        }
        else
        {
            NSLog(@"Exception is %@",[exception reason]);
            NSLog(@"HTTP error Code is %d",[exception httpErrorCode]);
            NSLog(@"App Error Code is %d",[exception appErrorCode]);
            NSLog(@"User Info is %@",[exception userInfo]);  
        }  
    }];
    
    
}

- (IBAction)backButton:(id)sender {
    //[self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
