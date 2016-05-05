//
//  SignInViewController.m
//  DailyGraphv1
//
//  Created by Mohnish Basha Shaikh on 4/27/16.
//  Copyright © 2016 Mohnish Basha Shaikh. All rights reserved.
//

#import "SignInViewController.h"

@interface SignInViewController ()
{
//CustomLoader *loader;

}

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [user resignFirstResponder];
    [pass resignFirstResponder];
    
     userDefaults = [NSUserDefaults standardUserDefaults];
    
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
 */-(void)loginValidate:(NSString *)userName password: (NSString *)password
{
    loader.hidden = NO;
    UserService *userService = [App42API buildUserService];
    
    NSMutableDictionary *otherMetaHeaders = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"true",@"userProfile", nil];
    
    [userService setOtherMetaHeaders:otherMetaHeaders];
    
    [userService authenticateUser:userName password:password completionBlock:^(BOOL success, id responseObj, App42Exception *exception)
     {
         if (success)
         {
             User *userDetail = (User *)responseObj;
             [SharedClass sharedManager].user = user;
             [SharedClass sharedManager].userName = userDetail.userName;
             NSLog(@"userName is %@" , userDetail.userName);
             NSLog(@"sessionId is %@" ,  userDetail.sessionId);
             NSLog(@"Password is %@",userDetail.password);
             [loader removeFromSuperview];
           //  NSLog(@"%@",user.profile.firstName);
             [userDefaults setValue:userDetail.userName forKey:@"USER_NAME"];
             [userDefaults setValue:pass.text forKey:@"PSWD"];
             [userDefaults setValue:userDetail.email forKey:@"EMAIL"];
             UITabBarController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"DummyTab"];
             [self.navigationController pushViewController:controller animated:YES];
             [controller setSelectedIndex:0];
             [self performSegueWithIdentifier:@"toNavigation" sender:self];
             
             
             if ([userDetail.profile.firstName isEqualToString:@""])
             {
                 homeViewController *homeVC = [homeViewController new];
                 [self presentViewController:homeVC animated:NO completion:nil];
                 [userDefaults setInteger:1 forKey:@"SETUP_PROFILE"];
                 [userDefaults synchronize];
                 loader.hidden = YES;
                 [loader removeFromSuperview];
                 
                 
             }
             else
             {
                 //[self showDashboard];
                 loader.hidden = YES;
                 [loader removeFromSuperview];
                 
                 [userDefaults setInteger:1 forKey:@"SETUP_PROFILE"];
                 [userDefaults synchronize];
             }
         }
         else
         {
             NSLog(@"Exception is %@",[exception reason]);
             //[self showAlert:@"UserName/Password did not match"];
             UIAlertController * alert=   [UIAlertController
                                           alertControllerWithTitle:@"Alert"
                                           message:@"UserName/Password did not match"
                                           preferredStyle:UIAlertControllerStyleAlert];
             
             UIAlertAction* OkButton = [UIAlertAction
                                        actionWithTitle:@"OK"
                                        style:UIAlertActionStyleDefault
                                        handler:^(UIAlertAction * action)
                                        {
                                            //Handel your yes please button action here
                                            
                                            
                                        }];
             
             [alert addAction:OkButton];
             
             
             [self presentViewController:alert animated:YES completion:nil];
             loader.hidden = YES;
             [loader removeFromSuperview];
             NSLog(@"HTTP error Code is %d",[exception httpErrorCode]);
             NSLog(@"App Error Code is %d",[exception appErrorCode]);
             NSLog(@"User Info is %@",[exception userInfo]);
         }
     }];
}


- (IBAction)login:(id)sender {
    if ([user.text isEqualToString:@""])
    { UIAlertController * alert=   [UIAlertController
                                    alertControllerWithTitle:@"Alert"
                                    message:@"Please enter Username"
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* OkButton = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       //Handel your yes please button action here
                                       
                                       
                                   }];
        
        [alert addAction:OkButton];
        
        
        [self presentViewController:alert animated:YES completion:nil];
        //[self showAlert:@"Please enter Username"];
    }
    else if ([pass.text isEqualToString:@""])
    {UIAlertController * alert=   [UIAlertController
                                   alertControllerWithTitle:@"Alert"
                                   message:@"Please enter Password"
                                   preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* OkButton = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       //Handel your yes please button action here
                                       
                                       
                                   }];
        
        [alert addAction:OkButton];
        
        
        [self presentViewController:alert animated:YES completion:nil];
        //[self Alert:@"Please enter Password"];
    }
    else{
        if ( user.text.length >20) {
            UIAlertController * alert=   [UIAlertController
                                          alertControllerWithTitle:@"Alert"
                                          message:@"Username cannot be greater than 20 character"
                                          preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* OkButton = [UIAlertAction
                                       actionWithTitle:@"OK"
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction * action)
                                       {
                                           //Handel your yes please button action here
                                           
                                           
                                       }];
            
            [alert addAction:OkButton];
            
            
            [self presentViewController:alert animated:YES completion:nil];
            //[self showAlert:@"Username cannot be greater than 20 character"];
        }
        else if (pass.text.length>20){
            UIAlertController * alert=   [UIAlertController
                                          alertControllerWithTitle:@"Alert"
                                          message:@"Password cannot be greater than 8 character"
                                          preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* OkButton = [UIAlertAction
                                       actionWithTitle:@"OK"
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction * action)
                                       {
                                           //Handel your yes please button action here
                                           
                                           
                                       }];
            
            [alert addAction:OkButton];
            
            
            [self presentViewController:alert animated:YES completion:nil];
            //[self showAlert:@"Password cannot be greater than 8 character"];
            
        }
        else
        {
            loader.hidden = NO;
            [self loginValidate:user.text password:pass.text];
        }
    }

//    NSString *userName = user.text;
//    NSString *pwd = pass.text;
//    [App42API initializeWithAPIKey:@"APP_KEY" andSecretKey:@"SECRET_KEY"];
//    UserService *userService = [App42API buildUserService];
//    [userService authenticateUser:userName password:pwd completionBlock:^(BOOL success, id responseObj, App42Exception *exception)
//    {
//        if (success)
//        {
//            User *userid = (User*)responseObj;
//            NSLog(@"userName is %@" , userid.userName);
//            NSLog(@"sessionId is %@" ,  userid.sessionId);
//            UITabBarController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"DummyTab"];
//            [self.navigationController pushViewController:controller animated:YES];
//            [controller setSelectedIndex:0];
//
//        }
//        else
//        {
//            NSLog(@"Exception is %@",[exception reason]);
//            NSLog(@"HTTP error Code is %d",[exception httpErrorCode]);
//            NSLog(@"App Error Code is %d",[exception appErrorCode]);
//            NSLog(@"User Info is %@",[exception userInfo]);
//        }  
//    }];
    
   
    
}

- (IBAction)forgetpassword:(id)sender {
    NSString *userName = user.text;
   NSMutableDictionary *otherMetaHeaders = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"true",@"emailVerification", nil];
    [App42API initializeWithAPIKey:@"APP_KEY" andSecretKey:@"SECRET_KEY"];
   UserService *userService = [App42API buildUserService];
    [userService setOtherMetaHeaders:otherMetaHeaders];
    
    //[userService resetUserPassword:userName completionBlock:^(BOOL success, id responseObj, App42Exception *exception)];
    
    if ([userName isEqualToString:@""])
    {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Alert"
                                      message:@"Please enter All the filled"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* OkButton = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       //Handel your yes please button action here
                                       
                                       
                                   }];
        
        [alert addAction:OkButton];
        
        
        [self presentViewController:alert animated:YES completion:nil];

        //[self showAlert:@"Please enter Username"];
    }
    
    else
    {
        loader.hidden = NO;
        NSString *userName = user.text;
        UserService *userService = [App42API buildUserService];
        NSMutableDictionary *otherMetaHeaders = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"true",@"emailVerification", nil];
           [App42API initializeWithAPIKey:@"APP_KEY" andSecretKey:@"SECRET_KEY"];
            //UserService *userService = [App42API buildUserService];
           [userService setOtherMetaHeaders:otherMetaHeaders];
     //   [userService resetUserPassword:userName completionBlock:^(BOOL success, id responseObj, App42Exception *exception)];
        
       // NSMutableDictionary *otherMetaHeaders = [NSMutableDictionary dictionaryWithObjectsAndKeys:userName,@"customName", nil];
        
        [userService setOtherMetaHeaders:otherMetaHeaders];
        
        [userService resetUserPassword:userName completionBlock:^(BOOL success, id responseObj, App42Exception *exception) {
            if (success)
            {
                App42Response *response = (App42Response*)responseObj;
                NSLog(@"Response is %@",response.strResponse);
                
                
                UIAlertController * alert=   [UIAlertController
                                              alertControllerWithTitle:@"Alert"
                                              message:@"Password sent to your mail"
                                              preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* OkButton = [UIAlertAction
                                           actionWithTitle:@"OK"
                                           style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction * action)
                                           {
                                               //Handel your yes please button action here
                                               
                                               
                                           }];
                
                [alert addAction:OkButton];

                
                
               // [self showAlert:@"Password sent to your mail"];
                //[loader removeFromSuperview];
            }
            else
            {
                NSLog(@"Exception = %@",exception);
                
                
                UIAlertController * alert=   [UIAlertController
                                              alertControllerWithTitle:@"Alert"
                                              message:@"Username Doesn't Exist"
                                              preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* OkButton = [UIAlertAction
                                           actionWithTitle:@"OK"
                                           style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction * action)
                                           {
                                               //Handel your yes please button action here
                                               
                                               
                                           }];
                
                [alert addAction:OkButton];
                
                
                
                
                
                
                
                
                
                
                
                
               // [self showAlert:@"Username Doesn't Exist"];
                //[loader removeFromSuperview];
                NSLog(@"HTTP error Code = %d",[exception httpErrorCode]);
                NSLog(@"App Error Code = %d",[exception appErrorCode]);
                NSLog(@"User Info = %@",[exception userInfo]);
            }
        }];
    }
    

}
-(void)buttonForgotPasswordClicked
        {
            
            if ([user.text isEqualToString:@""])
            {
                UIAlertController * alert=   [UIAlertController
                                              alertControllerWithTitle:@"Alert"
                                              message:@"Please enter Username"
                                              preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* OkButton = [UIAlertAction
                                           actionWithTitle:@"OK"
                                           style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction * action)
                                           {
                                               //Handel your yes please button action here
                                               
                                               
                                           }];
                
                [alert addAction:OkButton];
                
                
                [self presentViewController:alert animated:YES completion:nil];
                //[self showAlert:@"Please enter Username"];
            }
            else
            {
                loader.hidden = NO;
                NSString *userName = user.text;
                UserService *userService = [App42API buildUserService];
                
                NSMutableDictionary *otherMetaHeaders = [NSMutableDictionary dictionaryWithObjectsAndKeys:userName,@"customName", nil];
                
                [userService setOtherMetaHeaders:otherMetaHeaders];
                
                [userService resetUserPassword:userName completionBlock:^(BOOL success, id responseObj, App42Exception *exception) {
                    if (success)
                    {
                        App42Response *response = (App42Response*)responseObj;
                        NSLog(@"Response is %@",response.strResponse);
                        
                        UIAlertController * alert=   [UIAlertController
                                                      alertControllerWithTitle:@"Alert"
                                                      message:@"Password sent to your mail"
                                                      preferredStyle:UIAlertControllerStyleAlert];
                        
                        UIAlertAction* OkButton = [UIAlertAction
                                                   actionWithTitle:@"OK"
                                                   style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action)
                                                   {
                                                       //Handel your yes please button action here
                                                       
                                                       
                                                   }];
                        
                        [alert addAction:OkButton];
                        
                        
                        [self presentViewController:alert animated:YES completion:nil];
                       // [self showAlert:@"Password sent to your mail"];
                        [loader removeFromSuperview];
                    }
                    else
                    {
                        NSLog(@"Exception = %@",exception);
                        UIAlertController * alert=   [UIAlertController
                                                      alertControllerWithTitle:@"Alert"
                                                      message:@"Username Doesn't Exist"
                                                      preferredStyle:UIAlertControllerStyleAlert];
                        
                        UIAlertAction* OkButton = [UIAlertAction
                                                   actionWithTitle:@"OK"
                                                   style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action)
                                                   {
                                                       //Handel your yes please button action here
                                                       
                                                       
                                                   }];
                        
                        [alert addAction:OkButton];
                        
                        
                        [self presentViewController:alert animated:YES completion:nil];
                       // [self showAlert:@"Username Doesn't Exist"];
                        [loader removeFromSuperview];
                        NSLog(@"HTTP error Code = %d",[exception httpErrorCode]);
                        NSLog(@"App Error Code = %d",[exception appErrorCode]);
                        NSLog(@"User Info = %@",[exception userInfo]);
                    }  
                }];
            }
            
            
        }

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}
@end
