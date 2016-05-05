//
//  BaseViewController.m
//  FreeMeUp
//
//  Created by Abhay Bhusari on 28/03/16.
//  Copyright © 2016 Abhay Bhusari. All rights reserved.
//

#import "BaseViewController.h"
#import "CustomLoader.h"
#import "UIView+Autolayout.h"
@interface BaseViewController ()<UIImagePickerControllerDelegate , UINavigationControllerDelegate>
{
    CustomLoader *loader;

}
@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)showAlert:(NSString *)msg
{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Alert"
                                  message:@"Message"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* OkButton = [UIAlertAction
                                actionWithTitle:@"OK"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {
                                    //Handel your yes please button action here
                                    
                                    
                                }];
//    UIAlertAction* noButton = [UIAlertAction
//                               actionWithTitle:@"No, thanks"
//                               style:UIAlertActionStyleDefault
//                               handler:^(UIAlertAction * action)
//                               {
//                                   //Handel no, thanks button
//                                   
//                               }];
    
    [alert addAction:OkButton];
   // [alert addAction:noButton];
    
    [self presentViewController:alert animated:YES completion:nil];
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
//    [alert show];
}

-(CustomLoader *)createLoader
{
    loader = [[CustomLoader alloc]initWithLoaderMessage:@""];
    [self.view addSubview:loader];
    loader.hidden = YES;
    [loader enableAutolayout];
    [loader topMargin:0.0];
    [loader leadingMargin:0.0];
    [loader trailingMargin:0.0];
    [loader bottomMargin:0.0];
    
    return loader;
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

@end
