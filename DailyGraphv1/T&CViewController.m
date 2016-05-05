//
//  T&CViewController.m
//  DailyGraphv1
//
//  Created by Mohnish Basha Shaikh on 4/30/16.
//  Copyright © 2016 Mohnish Basha Shaikh. All rights reserved.
//

#import "T&CViewController.h"

@interface T_CViewController ()

@end

@implementation T_CViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *urlString = @"http://www.sourcefreeze.com";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    // Do any additional setup after loading the view.
    [_webView loadRequest:urlRequest];
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

- (IBAction)BackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
