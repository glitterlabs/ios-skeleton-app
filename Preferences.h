//
//  Preferences.h
//  FreeMeUp
//
//  Created by Abhay Bhusari on 20/03/16.
//  Copyright © 2016 Abhay Bhusari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@protocol PreferenceDelegate

@end

@interface Preferences : NSObject
+(void)RegistrationValidate:(NSString *)userName password:(NSString *)password andEmail:(NSString *)email;
+(NSManagedObjectContext *)managedObjectContext;
+(void)loginValidate:(NSString *)userName password: (NSString *)password;
+(NSString *)getDocumentDirectory;
+(void)StoreData:(NSDictionary *)dict;
@property (nonatomic , copy)id <PreferenceDelegate> delegate;

@end
