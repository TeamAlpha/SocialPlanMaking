//
//  Login.h
//  SocialPlanMaking
//
//  Created by Omar Thanawalla on 1/23/14.
//  Copyright (c) 2014 Omar Thanawalla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
@interface Login : UIViewController 

- (IBAction)LogIn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *EmailAddress;
@property (strong, nonatomic) IBOutlet UITextField *Password;

@end
