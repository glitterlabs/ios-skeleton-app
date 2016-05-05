//
//  SharedClass.h
//  FreeMeUp
//
//  Created by Abhay Bhusari on 25/03/16.
//  Copyright © 2016 Abhay Bhusari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Shephertz_App42_iOS_API/Shephertz_App42_iOS_API.h>
@interface SharedClass : NSObject
@property(nonatomic , strong)User *user;
@property (nonatomic , strong)NSString *userName;
+(SharedClass *)sharedManager;
@end
