//
//  homeViewController.h
//  DailyGraphv1
//
//  Created by Mohnish Basha Shaikh on 4/29/16.
//  Copyright © 2016 Mohnish Basha Shaikh. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "postcell.h"
#import "DetailedPostViewController.h"

@interface homeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSArray *senderImageArr;
    NSArray *postnameArr;
    NSArray *postdateArr;
    NSArray *postCaptionArr;
    NSArray *postImgArr;
    IBOutlet UITableView *postTableView;
    
}

@end
