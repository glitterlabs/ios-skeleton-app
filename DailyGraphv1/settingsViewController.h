//
//  settingsViewController.h
//  DailyGraphv1
//
//  Created by Mohnish Basha Shaikh on 4/29/16.
//  Copyright © 2016 Mohnish Basha Shaikh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignInViewController.h"


@interface settingsViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableview;


@end
