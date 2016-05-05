//
//  profileViewController.h
//  DailyGraphv1
//
//  Created by Mohnish Basha Shaikh on 4/30/16.
//  Copyright © 2016 Mohnish Basha Shaikh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignUpViewController.h"

@interface profileViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *profiletable;
- (IBAction)backbutton:(id)sender;


@end
