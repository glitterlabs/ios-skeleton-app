//
//  cameraViewController.h
//  DailyGraphv1
//
//  Created by Mohnish Basha Shaikh on 4/29/16.
//  Copyright © 2016 Mohnish Basha Shaikh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cameraViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>


@property (strong, nonatomic) IBOutlet UIImageView *ImageView;

- (IBAction)TakePhoto:(id)sender;


- (IBAction)selectaPhoto:(id)sender;



@end
