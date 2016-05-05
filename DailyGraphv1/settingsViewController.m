//
//  settingsViewController.m
//  DailyGraphv1
//
//  Created by Mohnish Basha Shaikh on 4/29/16.
//  Copyright © 2016 Mohnish Basha Shaikh. All rights reserved.
//

#import "settingsViewController.h"


@interface settingsViewController ()

@end

@implementation settingsViewController
{
    NSArray *options;
    NSArray *images;
    


}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    options =[NSArray arrayWithObjects:@"Profile",@"Change Password",@"Terms&Conditions",@"About",@"logout",nil];
    images =[NSArray arrayWithObjects:[UIImage imageNamed:@"user_male_circle_filled.png"],[UIImage imageNamed:@"key_exchange_filled.png"],[UIImage imageNamed:@"handshake_filled.png"],[UIImage imageNamed:@"high_importance_filled.png"],[UIImage imageNamed:@"exit_filled.png"], nil];
    
   // _tableview.backgroundColor=[UIColor colorWithRed:244/255 green:250/255 blue:250/255 alpha:1.0];
    
    
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [options count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [options objectAtIndex:indexPath.row];
    cell.imageView.image=[images objectAtIndex:indexPath.row];
    
//    if ( indexPath.row % 2 == 0 )
//        cell.backgroundColor =[UIColor colorWithRed:204/255.0f green:234/255.0f blue:231/255.0f alpha:1.0f];
//    else
//        cell.backgroundColor =[UIColor colorWithRed:205/255.0f green:200/255.0f blue:222/255.0f alpha:1.0f];
//    //cell.backgroundColor =[UIColor colorWithRed:204/255 green:234/255 blue:231/255 alpha:0.8];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 250;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self performSegueWithIdentifier:@"profileview" sender:self];
            break;
        case 1:
            [self performSegueWithIdentifier:@"changeview" sender:self];
            break;
        case 2:
            [self performSegueWithIdentifier:@"termC" sender:self];
            break;

        case 3:
            [self performSegueWithIdentifier:@"aboutView" sender:self];
            break;

        case 4:
            //[self performSegueWithIdentifier:@"BasicCoreDataSegue" sender:self];
            NSString *sessionId = @"<Enter_the_session_id>";
            [App42API initializeWithAPIKey:@"APP_KEY" andSecretKey:@"SECRET_KEY"];
            UserService *userService = [App42API buildUserService];
            [userService logout:sessionId completionBlock:^(BOOL success, id responseObj, App42Exception *exception) {
                if (success)
                {
                    App42Response *response = (App42Response*)responseObj;
                    NSLog(@"Response=%@",response.strResponse);
                }
                else
                {
                    NSLog(@"Exception = %@",[exception reason]);
                    NSLog(@"HTTP error Code = %d",[exception httpErrorCode]);
                    NSLog(@"App Error Code = %d",[exception appErrorCode]);  
                    NSLog(@"User Info = %@",[exception userInfo]);  
                }  
            }];
            [self dismissViewControllerAnimated:YES completion:nil];
            
            
            break;

        

        default:
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
