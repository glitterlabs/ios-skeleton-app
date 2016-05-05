//
//  profileViewController.m
//  DailyGraphv1
//
//  Created by Mohnish Basha Shaikh on 4/30/16.
//  Copyright © 2016 Mohnish Basha Shaikh. All rights reserved.
//

#import "profileViewController.h"

@interface profileViewController ()

@end

@implementation profileViewController{
   

    NSArray *detailArry;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    detailArry=[NSArray arrayWithObjects:@"Fullname = joey tribuione",@"Male",@"joeyTribune@yahoo.com",@"Contact = +21 4567891231" ,nil];
    SignUpViewController *objSignup =[[SignUpViewController alloc]init];
   
    
//   // NSString *userName =;
//    [App42API initializeWithAPIKey:@"APP_KEY" andSecretKey:@"SECRET_KEY"];
//    UserService *userService = [App42API buildUserService];
//   // [userService getUser:userName completionBlock:^(BOOL success, id responseObj, App42Exception *exception) {
//        if (success)
//        {
//            User *user = (User*)responseObj;
//            NSLog(@"userName is %@" , user.userName);
//            NSLog(@"emailId is %@" ,  user.email);
//            NSString *jsonResponse = [user toString];
//        }
//        else
//        {
//            NSLog(@"Exception is %@",[exception reason]);
//            NSLog(@"HTTP error Code is %d",[exception httpErrorCode]);
//            NSLog(@"App Error Code is %d",[exception appErrorCode]);
//            NSLog(@"User Info is %@",[exception userInfo]);
//        }  
//    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [detailArry count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [detailArry objectAtIndex:indexPath.row];
   // cell.imageView.image=[images objectAtIndex:indexPath.row];
    
    
        //cell.backgroundColor =[UIColor colorWithRed:205/255.0f green:200/255.0f blue:222/255.0f alpha:1.0f];
    //cell.backgroundColor =[UIColor colorWithRed:204/255 green:234/255 blue:231/255 alpha:0.8];
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backbutton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
