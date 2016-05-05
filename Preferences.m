//
//  Preferences.m
//  FreeMeUp
//
//  Created by Abhay Bhusari on 20/03/16.
//  Copyright © 2016 Abhay Bhusari. All rights reserved.
//

#import "Preferences.h"
#import <Shephertz_App42_iOS_API/Shephertz_App42_iOS_API.h>
#import "Constants.h"
@implementation Preferences
@synthesize delegate;
+(void)RegistrationValidate:(NSString *)userName password:(NSString *)password andEmail:(NSString *)email
{
    UserService *userService = [App42API buildUserService];
    [userService createUser:userName password:password emailAddress:email completionBlock:^(BOOL success, id responseObj, App42Exception *exception)
    {
        if (success)
        {
            User *user = (User*)responseObj;
            NSLog(@"userName is %@" , user.userName);
            NSLog(@"emailId is %@" ,  user.email);
            NSLog(@"SessionId is %@",user.sessionId);
           // NSString *jsonResponse = [user toString];
            [self showAlert:@"Registration Successfull"];
        }
        else
        {
            NSLog(@"Exception is %@",[exception reason]);
            NSLog(@"HTTP error Code is %d",[exception httpErrorCode]);
            NSLog(@"App Error Code is %d",[exception appErrorCode]);
            NSLog(@"User Info is %@",[exception userInfo]);
            
            if ([exception appErrorCode] == 0)
            {
                [self showAlert:[exception reason]];
                
            }
            else if ([exception appErrorCode] == 2001)
            {
                [self showAlert:@"Username already exist"];

            }
            else if ([exception appErrorCode] == 2005)
            {
                [self showAlert:@"User with email id already exist"];

            }
            else if ([exception appErrorCode] == 1401)
            {
                [self showAlert:@"Client is not authorized"];
 
            }
            else if ([exception appErrorCode] == 1500)
            {
                [self showAlert:@"Internal server error"];

            }
        }
    }];
}

+(void)loginValidate:(NSString *)userName password: (NSString *)password
{
    UserService *userService = [App42API buildUserService];
    [userService authenticateUser:userName password:password completionBlock:^(BOOL success, id responseObj, App42Exception *exception)
    {
        if (success)
        {
            User *user = (User*)responseObj;
            NSLog(@"userName is %@" , user.userName);
            NSLog(@"sessionId is %@" ,  user.sessionId);
            
        }
        else
        {
           // NSLog(@"Exception is %@",[exception reason]);
            [self showAlert:[exception reason]];
           // NSLog(@"HTTP error Code is %d",[exception httpErrorCode]);
           // NSLog(@"App Error Code is %d",[exception appErrorCode]);
           // NSLog(@"User Info is %@",[exception userInfo]);
        }  
    }];
}

+(void)showAlert:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
    [alert show];
}

+(NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)])
    {
        context = [delegate managedObjectContext];
    }
    return context;
}

+(NSString *)getDocumentDirectory
{
    NSString *documentdir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return documentdir;
}


+(void)StoreData:(NSDictionary *)dict
{
    NSMutableArray *mutableArray = [[NSMutableArray alloc]init];
    mutableArray = [[[NSUserDefaults standardUserDefaults]objectForKey:DATA_KEY]mutableCopy];
    [mutableArray addObject:dict];
    [[NSUserDefaults standardUserDefaults]setObject:mutableArray forKey:DATA_KEY];
    [[NSUserDefaults standardUserDefaults]synchronize];

}
@end
