//
//  postcell.h
//  DailyGraphv1
//
//  Created by Mohnish Basha Shaikh on 4/29/16.
//  Copyright © 2016 Mohnish Basha Shaikh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface postcell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *postname;
@property (strong, nonatomic) IBOutlet UILabel *postDate;
@property (strong, nonatomic) IBOutlet UIImageView *SendersImage;
@property (strong, nonatomic) IBOutlet UILabel *postCaption;
@property (strong, nonatomic) IBOutlet UIImageView *postImage;
@property (strong, nonatomic) IBOutlet UILabel *likeslabel;
@property (strong, nonatomic) IBOutlet UILabel *commentlabel;

@end
