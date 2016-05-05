//
//  homeViewController.m
//  DailyGraphv1
//
//  Created by Mohnish Basha Shaikh on 4/29/16.
//  Copyright © 2016 Mohnish Basha Shaikh. All rights reserved.
//

#import "homeViewController.h"

@interface homeViewController ()

@end

@implementation homeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    postnameArr=[NSArray arrayWithObjects:@"Bille",@"Mike",@"Ricky",@"Jhonson",@"Eric danial",@"Juck ma",@"Stevei", nil];
    senderImageArr=[NSArray arrayWithObjects:[UIImage imageNamed:@"profile1.png"],[UIImage imageNamed:@"profile2.png"],[UIImage imageNamed:@"profile3.png"],[UIImage imageNamed:@"profile4.png"],[UIImage imageNamed:@"profile5.png"],[UIImage imageNamed:@"profile6.png"],[UIImage imageNamed:@"profile7.png"],nil];
   
    postdateArr=[NSArray arrayWithObjects:@"28 feb 20:11",@"29 feb 10:11",@"18 feb 21:11",@"8 feb 10:21",@"6 feb 04:11",@"2 feb 2:10",@"29 feb 10:11",nil];
    postCaptionArr=[NSArray arrayWithObjects:@"My first collage",@"favorates moment",@"superb!!!",@"great",@"i like it",@"cooollll",@"superbb",nil];;
   postImgArr=[NSArray arrayWithObjects:[UIImage imageNamed:@"collage1.jpeg"],[UIImage imageNamed:@"collage2.jpg"],[UIImage imageNamed:@"collage3.jpg"],[UIImage imageNamed:@"collage4.jpg"],[UIImage imageNamed:@"collage5.jpg"],[UIImage imageNamed:@"download.jpeg"],[UIImage imageNamed:@"collage6.jpg"],nil];
    
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [[UITabBar appearance] setTintColor:[UIColor yellowColor]];
    
    postTableView.delegate=self;
    postTableView.dataSource=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return postnameArr.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *simpleTableIdentifier = @"postcell";
    
    postcell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[postcell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.postname.text = [postnameArr objectAtIndex:indexPath.row];
    cell.postImage.image=[postImgArr objectAtIndex:indexPath.row];
    cell.SendersImage.image=[senderImageArr objectAtIndex:indexPath.row];
    cell.postCaption.text=[postCaptionArr objectAtIndex:indexPath.row];
    
    
    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
  //  DetailedPostViewController *selectedPost=[[DetailedPostViewController alloc] init];
    
    
   // [self performSegueWithIdentifier:@"DetailedPostViewController" sender:self];
    // [self.navigationController presentViewController:selectedPost animated:YES completion:nil];
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
