//
//  SharedClass.m
//  FreeMeUp
//
//  Created by Abhay Bhusari on 25/03/16.
//  Copyright © 2016 Abhay Bhusari. All rights reserved.
//

#import "SharedClass.h"

@implementation SharedClass
+(SharedClass *)sharedManager
{
    static SharedClass *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

-(id)init
{
    self = [super init];
    if (self)
    {
        self.user = [[User alloc]init];
    }
    return self;
}

@end
