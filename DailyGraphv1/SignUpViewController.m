//
//  SignUpViewController.m
//  DailyGraphv1
//
//  Created by Mohnish Basha Shaikh on 4/27/16.
//  Copyright © 2016 Mohnish Basha Shaikh. All rights reserved.
//

#import "SignUpViewController.h"


@interface SignUpViewController ()
{
   // SignUpViewController * signUpViewController;
    CustomLoader *loader;


}

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    signUpViewController =[[SignUpViewController alloc]init];
//    // Do any additional setup after loading the view.
//    CGFloat height =self.view.frame.size.height *0.3;
//    [self.view addSubview:signUpViewController];
    [username resignFirstResponder];
    [password resignFirstResponder];
    [email resignFirstResponder];
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


- (IBAction)Register:(id)sender {
    
    if ([UserName.text isEqualToString:@""])
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
    else if ([password.text isEqualToString:@""])
    {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Alert"
                                      message:@"please enter an password"
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
        //[self showAlert:@"Please enter Password"];
    }
    else if ([email.text isEqualToString:@""])
    {UIAlertController * alert=   [UIAlertController
                                   alertControllerWithTitle:@"Alert"
                                   message:@"please Enter An email Id"
                                   preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* OkButton = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       //Handel your yes please button action here
                                       
                                       
                                   }];
        
        [alert addAction:OkButton];
        
        
       // [self presentViewController:alert animated:YES completion:nil];
        //[self showAlert:@"Please enter Email id"];
    }
    else
    {
        
        [self RegistrationValidate:UserName.text password:password.text andEmail:email.text];
         //SignInViewController *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
                                       // instantiateViewControllerWithIdentifier:@"signinview"];
        //[self.navigationController pushViewController:wc animated:YES];
        
       
           //[self performSegueWithIdentifier("ToSecond", sender: nil)]
        
    }
    
    
    
}
-(void)RegistrationValidate:(NSString *)userName password:(NSString *)password andEmail:(NSString *)email
{
    loader.hidden = NO;
    UserService *userService = [App42API buildUserService];
    [userService createUser:userName password:password emailAddress:email completionBlock:^(BOOL success, id responseObj, App42Exception *exception)
     {
         if (success)
         {
             loader.hidden = NO;
             User *user = (User*)responseObj;
             NSLog(@"userName is %@" , user.userName);
             NSLog(@"emailId is %@" ,  user.email);
             NSLog(@"SessionId is %@",user.sessionId);
             // NSString *jsonResponse = [user toString];
             //[self showAlert:@"Registration Successfull"];
            
             
             UIAlertController * alert=   [UIAlertController
                                           alertControllerWithTitle:@"Alert"
                                           message:@"Registration Successfull"
                                           preferredStyle:UIAlertControllerStyleAlert];
             
             UIAlertAction* OkButton = [UIAlertAction
                                        actionWithTitle:@"OK"
                                        style:UIAlertActionStyleDefault
                                        handler:^(UIAlertAction * action)
                                        {
                                            
                                        }];
             
             [alert addAction:OkButton];
            [self performSegueWithIdentifier:@"toSignIn" sender:self];
             
            // [self presentViewController:alert animated:YES completion:nil];
             //[self performSegueWithIdentifier:@"signIn" sender:nil];
             

             //[self dismissViewControllerAnimated:YES completion:nil];
            // loader.hidden = YES;
             
    
        }
         else
         {
             NSLog(@"Exception is %@",[exception reason]);
             NSLog(@"HTTP error Code is %d",[exception httpErrorCode]);
             NSLog(@"App Error Code is %d",[exception appErrorCode]);
             NSLog(@"User Info is %@",[exception userInfo]);
             
             if ([exception appErrorCode] == 0)
             {
                
                 UIAlertController * alert=   [UIAlertController
                                               alertControllerWithTitle:@"Alert"
                                               message:@"[Check Email Format]"
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
                 //[self showAlert:[exception reason]];
                 
             }
             else if ([exception appErrorCode] == 2001)
             {
                 UIAlertController * alert=   [UIAlertController
                                               alertControllerWithTitle:@"Alert"
                                               message:@"Username already exist"
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
                // [self showAlert:@"Username already exist"];
                 
             }
             else if ([exception appErrorCode] == 2005)
             {
                 UIAlertController * alert=   [UIAlertController
                                               alertControllerWithTitle:@"Alert"
                                               message:@"User with email id already exist"
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
                // [self showAlert:@"User with email id already exist"];
                 
             }
             else if ([exception appErrorCode] == 1401)
             {
                 UIAlertController * alert=   [UIAlertController
                                               alertControllerWithTitle:@"Alert"
                                               message:@"Client is not authorized"
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
                 //[self showAlert:@"Client is not authorized"];
                 
             }
             else if ([exception appErrorCode] == 1500)
             {
                 UIAlertController * alert=   [UIAlertController
                                               alertControllerWithTitle:@"Alert"
                                               message:@"Internal server error"
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
                 //[self showAlert:@"Internal server error"];
                 
             }
             loader.hidden = YES;
             
             
         }
     }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


@end
